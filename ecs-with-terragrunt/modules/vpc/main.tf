resource "aws_vpc" "vpc"{
cidr_block = var.vpc_cidr
enable_dns_hostnames = true
enable_dns_support   = true
tags = {
    Name = "ecswithterragrunt-${var.infra_env}-vpc"
    Environment = var.env
}
}


resource "aws_subnet" "public"{
vpc_id = aws_vpc.vpc.id
count = length(var.cidr_public)
cidr_block = element(var.cidr_public, count.index)
availability_zone = element(var.az, count.index)
map_public_ip_on_launch = true
tags  = {
    Name = "ecswithterragrunt-${var.infra_env}-publicsub"
    Environment = var.env
}
}


resource "aws_subnet" "private"{
vpc_id = aws_vpc.vpc.id
count = length(var.cidr_public)
cidr_block = element(var.cidr_private, count.index)
availability_zone = element(var.az, count.index)
tags  = {
    Name = "ecswithterragrunt-${var.infra_env}-privcsub"
    Environment = var.env
}
}



resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name      = "ecswithterragrunt-${var.infra_env}-gateway"
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "${var.infra_env}-public-route"
    Environment = var.env
  }
}


resource "aws_route_table_association" "public" {
  count          = length(var.cidr_public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}


resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  
  subnet_id      = aws_subnet.public[1].id

  tags = {
    Name      = "nat gw"
  }

 depends_on = [aws_internet_gateway.igw]
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name        = "${var.infra_env}-private-route"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.cidr_private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}
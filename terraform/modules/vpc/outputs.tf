output "vpc_id" {
  value = aws_vpc.vpc.id
}
 
output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}
 
output "vpc_public_subnets" {
 
  value = aws_subnet.public[*].id
}
 
output "vpc_private_subnets" {
  value = aws_subnet.private[*].id
}

output "public_internet_gateway_route_id" {
  value = aws_internet_gateway.igw.id
}

output "aws_nat_gateway" {
  value = aws_nat_gateway.ngw.id
}

output "aws_route_table_id" {
    value = aws_route_table.public.id
}

output "aws_route_table_association" {
  value = aws_route_table_association.public[*].id
}


output "aws_route_table_id_priv" {
    value = aws_route_table.private.id
}

output "aws_route_table_association_priv" {
  value = aws_route_table_association.private[*].id
}


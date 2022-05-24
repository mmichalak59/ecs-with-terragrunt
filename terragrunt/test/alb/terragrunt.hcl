terraform {
  source = "../../../terrafrom/modules/alb"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "eu-central-1"
  access_key = "***************"
  secret_key = "***************"	
}
EOF
}

dependency "vpc" {
  config_path = "../vpc"
}


inputs = {
app_name = "testapp"
lb_vpc  = dependency.vpc.outputs.vpc_id
lb_subnet_public = dependency.vpc.outputs.vpc_public_subnets
}

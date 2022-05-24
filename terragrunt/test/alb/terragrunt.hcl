terraform {
  # Deploy version v0.0.1 in prod
  source = "/home/pajton/sysadmins_task/ecs-with-terragrunt/modules/alb"
}

# Indicate what region to deploy the resources into
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

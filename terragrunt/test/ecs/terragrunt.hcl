terraform {

  source = "/home/pajton/sysadmins_task/ecs-with-terragrunt/modules/ecs"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "eu-central-1"
  access_key = "*************"
  secret_key = "*************"	
}
EOF
}

dependency "vpc" {
  config_path = "../vpc"
}
dependency "alb" {
  config_path = "../alb"
}


inputs = {
app_name = "testapp"
lb_vpc  = dependency.vpc.outputs.vpc_id
lb_subnet_public = dependency.vpc.outputs.vpc_public_subnets
lb_subnet_private = dependency.vpc.outputs.vpc_private_subnets
aws_lb_sec_group = dependency.alb.outputs.aws_lb_sec_group
target_group = dependency.alb.outputs.target_group
aws_lb_listener = dependency.alb.outputs.aws_lb_listener
repo_url = "registry.gitlab.com/lab-mmi/ecs_with_terragrunt/main:latest"
container_memory = "512"
container_cpu = "256"
}

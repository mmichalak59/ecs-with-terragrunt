terraform {
  source = "../../../terraform/modules/vpc"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "eu-central-1"
  access_key = "************"
  secret_key = "************"	
}
EOF
}



inputs = {
vpc_cidr  = "10.0.0.0/16"
cidr_private = ["10.0.10.0/24","10.0.20.0/24"]
cidr_public = ["10.0.30.0/24","10.0.40.0/24"]
az = ["eu-central-1a", "eu-central-1b"]
}

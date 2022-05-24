terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.10.0"
        }

    }
}

provider "aws" {
    region = "eu-central-1"
    access_key = "AKIAVOLF6F66P3Y67M4U"
    secret_key = "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"	
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    bucket  = "aws-ug-malang-terragrunt-demo-tfstate"
    key     = "terraform/prod/terraform.tfstate"
    region  = "ap-southeast-3"
    profile = "personal"
  }
}

provider "aws" {
  region  = "ap-southeast-3"
  profile = "personal"
}

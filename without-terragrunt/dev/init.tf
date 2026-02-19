terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
      profile = "personal"
    }
  }
  backend "s3" {
    bucket = var.tfstate_s3_bucket_name
    key    = "without-terragrunt/dev/"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Project = "AWS-UG-Malang-Terragrunt-Basic"
    }
  }
}
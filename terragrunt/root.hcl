# Root configuration
# Membaca variabel dari file terpusat
locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  bucket_name = local.common_vars.locals.tfstate_bucket_name
  aws_profile = local.common_vars.locals.aws_profile
  aws_region  = "ap-southeast-3"
}

terraform {
  before_hook "before_hook" {
    commands     = ["plan"]
    execute      = ["infracost", "breakdown", "--path", "."]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 6.28.0"
        }
    }
  }

  provider "aws" {
    region  = "${local.aws_region}"
    profile = "${local.aws_profile}"
    default_tags {
      tags = {
        ManagedBy = "Terragrunt"
        // Project   = "AWS-UG-Malang-Terragrunt"
      }
    }
  }
EOF
}

remote_state {
  backend = "s3"
  config  = {
    bucket       = "${local.bucket_name}"
    key          = "terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region       = "${local.aws_region}"
    encrypt      = true
    use_lockfile = true
    profile      = "${local.aws_profile}"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
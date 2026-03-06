locals {
  env = "${basename(dirname(get_terragrunt_dir()))}"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../units/ec2"
}

dependency "vpc" {
  config_path = "../VPC"
}

inputs = {
  env               = local.env
  security_group_id = dependency.vpc.outputs.security_group_id
  subnet_id         = dependency.vpc.outputs.public_subnet_id
}

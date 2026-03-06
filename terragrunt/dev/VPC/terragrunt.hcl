locals {
  env = "${basename(dirname(get_terragrunt_dir()))}"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../units/vpc"
}

inputs = {
  env               = local.env
  vpc_cidr            = "10.3.0.0/16"
  public_subnet_cidr  = "10.3.1.0/24"
  private_subnet_cidr = "10.3.2.0/24"
  availability_zone   = "ap-southeast-3b"
}

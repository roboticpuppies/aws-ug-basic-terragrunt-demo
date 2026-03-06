module "vpc" {
  source = "../../units/vpc"

  vpc_cidr            = var.vpc_cidr
  env                 = var.env
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

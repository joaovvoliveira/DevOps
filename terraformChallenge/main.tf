provider "aws" {
  region  = var.region
  profile = "victor"
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_name           = var.vpc_name
  cidr_block         = var.cidr_block
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = true
  azs                = data.aws_availability_zones.available.names
}

data "aws_availability_zones" "available" {}

output "vpc_id" {
  value = module.vpc.vpc_id
}

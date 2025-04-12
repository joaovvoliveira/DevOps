provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = var.vpc_cidr
  name       = "dev-vpc"
}

module "subnet" {
  source     = "../../modules/subnet"
  vpc_id     = module.vpc.vpc_id
  cidr_block = var.subnet_cidr
  name       = "dev-subnet"
}

module "ec2" {
  source        = "../../modules/ec2"
  subnet_id     = module.subnet.subnet_id
  instance_type = var.instance_type
  ami_id        = var.ami_id
  name          = "dev-instance"
}
data "aws_availability_zones" "available" {}

module "s3" {
  source = "./Modules/s3"

}

module "ec2" {
  source = "./Modules/ec2"

  depends_on = [module.s3]
}

module "vpc" {
  source     = "./Modules/vpc"
  cidr_block = "10.0.0.0/16"

  depends_on = [module.s3]
}

module "subnet" {
  source       = "./Modules/subnet"
  vpc_id       = module.vpc.vpc_id
  azs          = slice(data.aws_availability_zones.available.names, 0, 2)
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  depends_on   = [module.s3]
}

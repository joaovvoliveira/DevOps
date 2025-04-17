module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${random_string.random_name.result}-vpc-${terraform.workspace}"

}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
}

resource "random_string" "random_name" {
  length  = 16
  upper   = false
  lower   = true
  special = false
}
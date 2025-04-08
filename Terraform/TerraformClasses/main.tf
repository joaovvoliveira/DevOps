module "s3" {
  source = "./modules/s3"
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_domain_name

  depends_on = [
    module.s3
  ]
}

# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = "${var.org_name}-bucket-iac-${terraform.workspace}373563"

#   tags = {
#     Name        = "First-bucket"
#     Iac         = true
#     Owner       = "Victor"
#     Environment = "Development"
#     CreatedAt   = "2023-10-01"
#     CreatedBy   = "Terraform"
#     Version     = "1.0"
#     Context     = "${terraform.workspace}"
#   }
# }

# module "cloudfront" {
#   source = "terraform-aws-modules/cloudfront/aws"
#   version = "~> 3.0"

#   aliases = ["${var.org_name}-bucket-iac-${terraform.workspace}373563"]
#   default_root_object = "index.html"
#   origin_id = "${var.org_name}-bucket-iac-${terraform.workspace}373563"
#   price_class = "PriceClass_All"
#   enabled = true
#   is_ipv6_enabled = true
#   wait_for_deployment = true

#   tags = {
#     Name        = "First-cloudfront"
#     Iac         = true
#     Owner       = "Victor"
#     Environment = "Development"
#     CreatedAt   = "2023-10-01"
#     CreatedBy   = "Terraform"
#     Version     = "1.0"
#     Context     = "${terraform.workspace}"
#   }

# }

# module "ec2_instance" {
#   source                 = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 5.0"
#   name                   = "${var.org_name}-${terraform.workspace}-instance"
#   instance_type          = "t2.micro"
#   key_name               = "victor-key"
#   monitoring             = true
#   vpc_security_group_ids = ["sg-0169c99bf4d715390"]
#   subnet_id              = "subnet-0b03e6dcbce443d0d"
#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#     Description = "This is my first ec2 created with Terraform"
#     Project     = "Terraform"
#     Team        = "DevOps"
#   }
# }

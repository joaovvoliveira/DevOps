resource "aws_s3_bucket" "s3_bucket" {
  bucket = "rocketseat-bucket-iac-${terraform.workspace}373563"

  tags = {
    Name        = "First-bucket"
    Iac         = true
    Owner       = "Victor"
    Environment = "Development"
    CreatedAt   = "2023-10-01"
    CreatedBy   = "Terraform"
    Version     = "1.0"
    Context     = "${terraform.workspace}"
  }
}

module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"
  name                   = "${terraform.workspace}-instance"
  instance_type          = "t2.micro"
  key_name               = "victor-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0169c99bf4d715390"]
  subnet_id              = "subnet-0b03e6dcbce443d0d"
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Description = "This is my first ec2 created with Terraform"
    Project     = "Terraform"
    Team        = "DevOps"
  }
}
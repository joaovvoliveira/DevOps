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
    Description = "This is my first bucket created with Terraform"
    Project     = "Terraform"
    Team        = "DevOps"
    Context     = "${terraform.workspace}"
  }
}
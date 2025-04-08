resource "aws_s3_bucket" "bucket" {
  bucket = "${var.org_name}-bucket-iac-${terraform.workspace}373563"

  tags = {
    Name        = "${var.org_name}-bucket-iac-${terraform.workspace}373563"
    Environment = terraform.workspace
  }
}



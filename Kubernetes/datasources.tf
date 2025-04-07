data "aws_s3_bucket" "bucket" {
  bucket = "rocketseat-bucket-iac-${terraform.workspace}373563"
}
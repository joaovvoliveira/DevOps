resource "aws_s3_bucket" "s3_bucket" {
    bucket = "rocketseat-bucket-iac"

    tags = {
      Name = "First-bucket"
      Iac = true
    }
}
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.org_name}-bucket-${terraform.workspace}"
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }

  depends_on = [
    aws_s3_bucket.bucket
  ]
}

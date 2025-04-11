resource "aws_s3_bucket" "bucket" {
  bucket = "${var.org_name}-bucket-${terraform.workspace}1235rsh64s65r4h13"
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

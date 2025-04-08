output "bucket_domain_name" {
  value       = data.aws_s3_bucket.bucket.bucket_domain_name
  description = "Domain name of the bucket"
  sensitive   = false
}

output "bucket_id" {
  value       = data.aws_s3_bucket.bucket.id
  description = "ID of the bucket"
  sensitive   = false

}

output "state_bucket_name" {
  description = "S3 bucket name"
  value = "${coalesce(join("", aws_s3_bucket.state_bucket.*.bucket), join("", aws_s3_bucket.state_bucket_prefixed.*.bucket))}"
}

output "lock_table_name" {
  description = "DynamoDB table name"
  value       = "${aws_dynamodb_table.terraform_lock_table.name}"
}

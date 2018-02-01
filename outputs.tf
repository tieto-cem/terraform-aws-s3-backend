
output "s3_bucket_name" {
  description = "S3 bucket name"
  value = "${aws_s3_bucket.terraform_state_bucket.bucket}"
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value = "${aws_dynamodb_table.terraform_lock_table.name}"
}

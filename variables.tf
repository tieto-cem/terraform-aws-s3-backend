variable "s3_state_bucket_name" {
  description = "S3 bucket name for storing Terraform state files"
}

variable "dynamodb_lock_table_name" {
  description = "DynamoDB table name used to maintain locks"
}
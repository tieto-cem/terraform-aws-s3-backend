variable "state_bucket_name_prefix" {
  description = "Name prefix for S3 bucket where Terraform state files are stored"
}

variable "state_lock_table_name" {
  description = "DynamoDB table name used to maintain locks"
}
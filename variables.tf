variable "state_bucket_name_prefix" {
  description = "Name prefix for S3 bucket where Terraform state files are stored"
}

variable "state_bucket_versioning_enabled" {
  description = "Whether to enable state bucket versioning or not."
  default     = true
}

variable "state_bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  default = false
}

variable "state_lock_table_name" {
  description = "DynamoDB table name used to maintain locks"
}


variable "bucket_name" {
  description = "Name prefix for S3 bucket where Terraform state files are stored"
}

variable "bucket_name_uuid_suffix" {
  description = "Whether bucket name should be made uqique by suffixing it with uuid or not"
  default = false
}

variable "bucket_versioned" {
  description = "Whether to enable state bucket versioning or not."
  default     = true
}

variable "bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  default = false
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name used to maintain locks"
}


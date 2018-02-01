provider "aws" {
  region = "eu-west-1"
}

module "terraform_s3_backend" {
  source                   = ".."
  s3_state_bucket_name     = "myapp-terraform-state-bucket"
  dynamodb_lock_table_name = "myapp-terraform-state-lock-table"
}

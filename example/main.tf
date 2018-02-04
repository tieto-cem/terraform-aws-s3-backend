provider "aws" {
  region = "eu-west-1"
}

module "terraform_s3_backend" {
  source                   = ".."
  state_bucket_name_prefix = "myapp-terraform-state-bucket"
  state_lock_table_name    = "myapp-terraform-state-lock-table"
}

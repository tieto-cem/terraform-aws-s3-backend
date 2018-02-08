provider "aws" {
  region = "eu-west-1"
}

module "terraform_s3_backend" {
  source              = ".."
  bucket_name         = "myapp-terraform-state-bucket"
  dynamodb_table_name = "myapp-terraform-state-lock-table"
}

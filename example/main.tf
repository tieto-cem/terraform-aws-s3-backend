provider "aws" {
  region = "eu-west-1"
}

module "terraform_s3_backend" {
  source              = ".."
  bucket_name         = "myapp-state-bucket"
  dynamodb_table_name = "myapp-lock-table"
}

[![CircleCI](https://circleci.com/gh/tieto-cem/terraform-aws-vpc.svg?style=shield&circle-token=b87b5b396b1fb627b8c4b2a16cff65d8f153ebfd)](https://circleci.com/gh/tieto-cem/terraform-aws-vpc)

Terraform S3 backend module
===========================================

Terraform module which creates Terraform S3 backend resources: S3 bucket for storing state files
and DynamoDB table for concurrency control.

Usage
-----

```hcl
provider "aws" {
  region = "eu-west-1"
}

module "terraform_s3_backend" {
  source                   = "github.com/tieto-cem/terraform-aws-s3-backend?ref=v0.1.0"
  s3_state_bucket_name     = "myapp-terraform-state-bucket"
  dynamodb_lock_table_name = "myapp-terraform-state-lock-table"
}
```

Resource naming
---------------

This module names AWS resources as follows:

| Name                                       | Type                      | 
|--------------------------------------------|---------------------------|
|${var.s3_state_bucket_name}                 | S3 bucket                 |
|${var.s3_state_bucket_name}-access-logs     | S3 bucket for access logs |
|${var.dynamodb_lock_table_name}             | DynamoDB table            |


Examples
-------

* [Example](https://github.com/tieto-cem/terraform-aws-s3-backend/tree/master/example)
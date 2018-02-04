[![CircleCI](https://circleci.com/gh/tieto-cem/terraform-aws-s3-backend.svg?style=shield&circle-token=d3789dd28673fbbd6642eb9701a2f0118cf3e904)](https://circleci.com/gh/tieto-cem/terraform-aws-s3-backend)

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
  source                   = "github.com/tieto-cem/terraform-aws-s3-backend?ref=v0.1.1"
  state_bucket_name_prefix = "myapp-terraform-state-bucket"
  lock_table_name          = "myapp-terraform-state-lock-table"
}
```

Resource naming
---------------

This module names AWS resources as follows:

| Name                                       | Type                      | 
|--------------------------------------------|---------------------------|
|${var.state_bucket_name_prefix}...          | S3 bucket                 |
|${state_bucket_name}-access-logs            | S3 bucket for access logs |
|${var.lock_table_name}                      | DynamoDB table            |


Examples
-------

* [Example](https://github.com/tieto-cem/terraform-aws-s3-backend/tree/master/example)

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "${var.s3_state_bucket_name}"
  acl    = "private"
  force_destroy = false

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.terraform_state_access_log_bucket.id}"
    target_prefix = "state_log/"
  }
}

resource "aws_s3_bucket" "terraform_state_access_log_bucket" {
  bucket = "${var.s3_state_bucket_name}-access-logs"
  acl    = "log-delivery-write"
  force_destroy = true
}

resource "aws_dynamodb_table" "terraform_lock_table" {
  name           = "${var.dynamodb_lock_table_name}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
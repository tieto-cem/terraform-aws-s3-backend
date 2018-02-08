
resource "aws_s3_bucket" "state_bucket_prefixed" {
  count = "${var.bucket_name_uuid_suffix ? 1 : 0}"
  bucket_prefix = "${var.bucket_name}-"
  acl           = "private"
  force_destroy = "${var.bucket_force_destroy}"

  versioning {
    enabled = "${var.bucket_versioned}"
  }

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "state_log/"
  }
}

resource "aws_s3_bucket" "state_bucket" {
  count = "${var.bucket_name_uuid_suffix ? 0 : 1}"
  bucket_name = "${var.bucket_name}"
  acl           = "private"
  force_destroy = "${var.bucket_force_destroy}"

  versioning {
    enabled = "${var.bucket_versioned}"
  }

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "state_log/"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket_prefix = "${var.bucket_name}-access-logs-"
  acl           = "log-delivery-write"
  force_destroy = true
}

resource "aws_dynamodb_table" "terraform_lock_table" {
  name           = "${var.dynamodb_table_name}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
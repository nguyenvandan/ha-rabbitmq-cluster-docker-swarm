provider "aws" {
  access_key = "AKIA4VDR3OKXEEWJEW42"
  secret_key = "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"
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "vandan-terraform-tfstate"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-locking"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
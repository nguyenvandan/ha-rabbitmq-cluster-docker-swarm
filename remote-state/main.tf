# AWS Config
variable "aws_access_key" {}
variable "aws_secret_key" {}


provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
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
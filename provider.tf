provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"

  version = "~> 2.4"
}

terraform {
  backend "s3" {
    bucket = "vandan-terraform-tfstate"
    workspace_key_prefix = "rabbitmq"
    key = "deployed.tfstate"
    dynamodb_table = "terraform-locking"
    region = "eu-west-1"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.25.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags {
    VPC = "${var.vpc_key}"
    Name = "${var.vpc_key}-vpc"
    Terraform = "Terraform"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.vpc_key}-ig"
    VPC = "${var.vpc_key}"
    Terraform = "Terraform"
  }
}
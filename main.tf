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

resource "aws_key_pair" "my-rabbitmq-key" {
  key_name   = "my_rabbitmq_key"
  public_key = "${file("${var.public_key}")}"
}

module "rabbitmq-node1" {
  source = "rabbitmq-server"

  name            = "rabbitmq-node1"
  key_pair        = "${aws_key_pair.my-rabbitmq-key.key_name}"
  key_pair_key    = "${var.private_key}"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
}

module "rabbitmq-node2" {
  source = "rabbitmq-server"

  name            = "rabbitmq-node2"
  key_pair        = "${aws_key_pair.my-rabbitmq-key.key_name}"
  key_pair_key    = "${var.private_key}"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
}

module "rabbitmq-node3" {
  source = "rabbitmq-server"

  name            = "rabbitmq-node3"
  key_pair        = "${aws_key_pair.my-rabbitmq-key.key_name}"
  key_pair_key    = "${var.private_key}"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
}



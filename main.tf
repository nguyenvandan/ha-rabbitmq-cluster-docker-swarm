terraform {
  backend "s3" {
    bucket = "vandan-terraform-tfstate"
    workspace_key_prefix = "rabbitmq"
    key = "deployed.tfstate"
    dynamodb_table = "terraform-locking"
    region = "eu-west-1"
    shared_credentials_file = "env\\secret.tfvars"
  }
}

resource "aws_key_pair" "my-rabbitmq-key" {
  key_name   = "my_rabbitmq_key"
  public_key = "${file("${var.public_key}")}"
}

module "my-rabbitmq-server" {
  source = "rabbitmq-server"

  name            = "rabbitmq-server"
  key_pair        = "${aws_key_pair.my-rabbitmq-key.key_name}"
  key_pair_key    = "${var.private_key}"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
}


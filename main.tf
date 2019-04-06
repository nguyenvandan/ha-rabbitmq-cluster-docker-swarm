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

# Template to install Docker
data "template_file" "docker_installation" {
  template = "${file("template/user_data.tpl")}"
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

  instance_user_data = "${data.template_file.docker_installation.rendered}"
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

  instance_user_data = "${data.template_file.docker_installation.rendered}"
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

  instance_user_data = "${data.template_file.docker_installation.rendered}"
}


## OUTPUT
# Node 1
output "node1-public-ip" {
  value = "${module.rabbitmq-node1.server-public-ip}"
}

output "node1-public-dns" {
  value = "${module.rabbitmq-node1.server-public-dns}"
}

output "node1-private-ip" {
  value = "${module.rabbitmq-node1.server-private-ip}"
}
# Node 2
output "node2-public-ip" {
  value = "${module.rabbitmq-node2.server-public-ip}"
}

output "node2-public-dns" {
  value = "${module.rabbitmq-node2.server-public-dns}"
}

output "node2-private-ip" {
  value = "${module.rabbitmq-node2.server-private-ip}"
}
# Node 3
output "node3-public-ip" {
  value = "${module.rabbitmq-node3.server-public-ip}"
}

output "node3-public-dns" {
  value = "${module.rabbitmq-node3.server-public-dns}"
}

output "node3-private-ip" {
  value = "${module.rabbitmq-node3.server-private-ip}"
}




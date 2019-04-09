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




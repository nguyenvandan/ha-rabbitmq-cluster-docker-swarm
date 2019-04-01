resource "aws_key_pair" "my-rabbitmq-key" {
  key_name   = "my_rabbitmq_key"
  public_key = "${file("id_rsa.pub")}"
}

module "my-rabbitmq-server" {
  source = "rabbitmq-server"

  name            = "rabbitmq-instance"
  key_pair        = "${aws_key_pair.my-rabbitmq-key.key_name}"
  key_pair_key    = "~/.ssh/id_rsa"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
}


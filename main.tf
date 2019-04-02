resource "aws_key_pair" "my-rabbitmq-key" {
  key_name   = "my_rabbitmq_key"
  public_key = "${file("C:\\Users\\vanguyen\\.ssh\\id_rsa.pub")}"
}

module "my-rabbitmq-server" {
  source = "rabbitmq-server"

  name            = "rabbitmq-server"
  key_pair        = "${aws_key_pair.my-rabbitmq-key.key_name}"
  key_pair_key    = "C:\\Users\\vanguyen\\.ssh\\id_rsa"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
}


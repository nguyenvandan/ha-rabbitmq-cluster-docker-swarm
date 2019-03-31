resource "aws_instance" "rabbitmq-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]
  key_name = "${aws_key_pair.rabbitmq-key.key_name}"

  tags {
    Name = "rabbitmq-instance"
  }
}

resource "aws_eip" "rabbitmq-eip" {
  instance = "${aws_instance.rabbitmq-instance.id}"
}
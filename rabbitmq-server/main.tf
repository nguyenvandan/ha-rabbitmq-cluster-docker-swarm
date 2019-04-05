resource "aws_instance" "rabbitmq-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_pair}"

  security_groups = ["${var.security_groups}"]

  user_data       = "${var.instance_user_data}"

  tags {
    Name = "${var.name}"
  }
}
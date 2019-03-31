resource "aws_instance" "rabbitmq-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"

  tags {
    Name = "rabbitmq-instance"
  }
}

resource "aws_eip" "rabbitmq-eip" {
  instance = "${aws_instance.rabbitmq-instance.id}"
}
resource "aws_eip" "rabbitmq-eip" {
  instance = "${aws_instance.rabbitmq-instance.id}"
}
output "server-ip" {
  value = "${aws_eip.rabbitmq-eip.public_ip}"
}
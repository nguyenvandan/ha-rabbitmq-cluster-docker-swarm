resource "aws_key_pair" "rabbitmq-key" {
  key_name   = "disney-key"
  public_key = "${file("id_rsa.pub")}"
}
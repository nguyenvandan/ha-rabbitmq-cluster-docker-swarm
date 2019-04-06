###################### DATA
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

###################### RESOURCES
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

###################### OUTPUT
output "server-public-ip" {
  value = "${aws_instance.rabbitmq-instance.public_ip}"
}

output "server-public-dns" {
  value = "${aws_instance.rabbitmq-instance.public_dns}"
}

output "server-private-ip" {
  value = "${aws_instance.rabbitmq-instance.private_ip}"
}
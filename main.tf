resource "aws_instance" "rabbitmq-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_pair}"

  security_groups = [
    "${aws_security_group.allow_ssh.name}",
    "${aws_security_group.allow_outbound.name}"
  ]

  provisioner "remote-exec" {
    inline = [
      "echo VanDan"
    ]

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file(${var.key_pair_key})}"
    }
  }

  tags {
    Name = "${var.name}"
  }
}

resource "aws_eip" "rabbitmq-eip" {
  instance = "${aws_instance.rabbitmq-instance.id}"
}
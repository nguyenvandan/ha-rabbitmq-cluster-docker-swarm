## OUTPUT
# Node 1
output "node1-public-ip" {
  value = "${module.rabbitmq-node1.server-public-ip}"
}

output "node1-public-dns" {
  value = "${module.rabbitmq-node1.server-public-dns}"
}

output "node1-private-ip" {
  value = "${module.rabbitmq-node1.server-private-ip}"
}
# Node 2
output "node2-public-ip" {
  value = "${module.rabbitmq-node2.server-public-ip}"
}

output "node2-public-dns" {
  value = "${module.rabbitmq-node2.server-public-dns}"
}

output "node2-private-ip" {
  value = "${module.rabbitmq-node2.server-private-ip}"
}
# Node 3
output "node3-public-ip" {
  value = "${module.rabbitmq-node3.server-public-ip}"
}

output "node3-public-dns" {
  value = "${module.rabbitmq-node3.server-public-dns}"
}

output "node3-private-ip" {
  value = "${module.rabbitmq-node3.server-private-ip}"
}

# VPC
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vcp_cidr_1" {
  value = "${cidrhost(aws_vpc.vpc.cidr_block,1)}"
}
output "vcp_cidr_sub_1" {
  value = "${cidrsubnet(aws_vpc.vpc.cidr_block,8,1)}"
}

output "vpc_subnet_a" {
  value = "${aws_subnet.a.id}"
}
output "vpc_subnet_b" {
  value = "${aws_subnet.b.id}"
}
output "vpc_subnet_c" {
  value = "${aws_subnet.c.id}"
}
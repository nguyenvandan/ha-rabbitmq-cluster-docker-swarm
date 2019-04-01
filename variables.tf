variable "instance_type" {
  type = "string"
  default = "t2.micro"
}

variable "name" {
  type = "string"
  default = "rabbitmq-instance"
}

variable "key_pair" {
  type = "string"
  default = "disney-key"
}

variable "key_pair_key" {
  type = "string"
  default = "C:\\Users\\vanguyen\\.ssh\\id_rsa"
}

variable "security_groups" {
  type = "list"
  default = []
}
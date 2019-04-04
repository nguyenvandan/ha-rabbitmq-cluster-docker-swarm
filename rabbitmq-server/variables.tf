variable "instance_type" {
  type = "string"
  default = "t2.micro"
}

variable "name" {
  type = "string"
}

variable "key_pair" {
  type = "string"
  default = "disney-key"
}

variable "key_pair_key" {
  type = "string"
}

variable "security_groups" {
  type = "list"
  default = []
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "rabbitmq-server/install-docker.sh"
}
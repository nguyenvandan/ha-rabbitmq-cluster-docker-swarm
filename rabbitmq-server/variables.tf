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

variable "instance_user_data" {}
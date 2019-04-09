# AWS Config
variable "aws_access_key" {}
variable "aws_secret_key" {}

# SSH key
variable "public_key" {}
variable "private_key" {}

# VPC
variable "vpc_key" {
  description = "A unique identifier for the VPC."
  default     = "vandan"
}
variable "aws_region" {}
variable "ssh_public_key" {
  description = "Public SSH key content (from GitHub Secret)"
  type        = string
}

variable "key_name" {}
variable "public_key_path" {}
variable "vpc_id" {}

variable "ami_id" {}
variable "instance_type" {
    default = "t2.micro"
}


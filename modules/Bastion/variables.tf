variable "vpc_id" {
  description = "The VPC ID"
}

variable "public_subnets" {
  type = string
}

variable "bastion_security_group" {
  type = list(string)
}

variable "vpc_id" {
  description = "The VPC ID"
}

variable "alb_security_group" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}


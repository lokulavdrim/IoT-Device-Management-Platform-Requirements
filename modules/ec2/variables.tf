variable "ec2_security_group" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "aws_efs_file_system_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}


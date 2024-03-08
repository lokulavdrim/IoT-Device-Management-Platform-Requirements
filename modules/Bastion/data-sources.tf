/*
data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"]
  }
}

data "aws_security_group" "bastion_security_group" {
  filter {
    name   = "bastion_sg"
    values = ["my-bastion-security-group"]
  }
}
*/

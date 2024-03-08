/*
data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"]
  }
}

data "aws_security_group" "alb_security_group" {
  filter {
    name   = "alb_security_group"
    values = ["my-alb-security-group"]
  }
}
*/

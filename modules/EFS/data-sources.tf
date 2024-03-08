/*
data "aws_security_group" "efs_sg" {
  filter {
    name   = "tag:Name"
    values = ["efs_sg"]
  }
}

data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"]
  }
}
*/

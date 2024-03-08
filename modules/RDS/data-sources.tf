/*
data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
  filter {
    name   = "tag:Name"
    values = ["private-subnet-*"]
  }
}
*/

/*
data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"]
  }
}

data "aws_security_group" "ec2_security_group" {
  filter {
    name   = "tag:Name"
    values = ["ec2_security_group"]
  }
}

data "aws_efs_file_system" "main_efs" {
  tags = {
    Name = "MainEFS"
  }
}
*/

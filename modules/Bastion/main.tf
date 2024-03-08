resource "aws_instance" "bastion_host" {
  ami           = "ami-0fc3317b37c1269d3"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnets
#  key_name      = "your-key-pair-name"    # Your SSH key pair name

  vpc_security_group_ids = var.bastion_security_group
	
  tags = {
    Name = "BastionHost"
  }
}

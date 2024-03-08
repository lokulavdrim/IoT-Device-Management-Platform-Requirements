output "alb_security_group" {
  value = aws_security_group.alb_security_group.id
}

output "bastion_security_group" {
  value = aws_security_group.bastion_security_group.id
}

output "ec2_security_group" {
  value = aws_security_group.ec2_security_group.id
}

output "efs_security_group" {
  value = aws_security_group.efs_security_group.id
}

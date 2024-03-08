output "my_aws_load_balancer_id" {
  value = aws_lb.my_alb.id
}

output "aws_lb_target_group" {
  value = aws_lb_target_group.my_target_group.id
}

output "target_group_arn" {
  value = aws_lb_target_group.my_target_group.arn
}

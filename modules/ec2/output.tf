output "aws_launch_template_id" {
  value = aws_launch_template.main_launch_template.id
}

output "aws_autoscaling_group_name" {
  value = aws_autoscaling_group.main_autoscaling_group.name
}

output "aws_autoscaling_group_id" {
  value = aws_autoscaling_group.main_autoscaling_group.id
}


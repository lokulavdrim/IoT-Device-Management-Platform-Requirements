output "aurora_subnet_group_id" {
  value = aws_db_subnet_group.aurora_subnet_group.id
}

output "aurora_cluster_id" {
  value = aws_rds_cluster.aurora_cluster.id
}

output "aurora_instance_id" {
  value = aws_rds_cluster_instance.aurora_instance.id
}

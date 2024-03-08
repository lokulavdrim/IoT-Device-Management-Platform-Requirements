resource "random_password" "password" {
  length  = 16
  special = false
}

resource "aws_secretsmanager_secret" "db_password" {
  name = "aurora-db-pass"
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = random_password.password.result
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnet-group1"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My Aurora DB Subnet Group"
  }
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  database_name           = "iot_device_db"
  master_username         = "admin"
  master_password         = aws_secretsmanager_secret_version.db_password.secret_string
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  skip_final_snapshot     = false
  final_snapshot_identifier = "aurora-cluster-demo-final-snapshot"
  backup_retention_period = 7 # Retain backups for 7 days
  preferred_backup_window = "03:00-05:00"
  apply_immediately       = "true"
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  identifier         = "aurora-instance"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = "db.t3.medium"
  engine             = "aurora-mysql"
}

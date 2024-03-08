resource "aws_efs_file_system" "main_efs" {
  creation_token = "main-efs"

  tags = {
    Name = "MainEFS"
  }
}

resource "aws_efs_mount_target" "efs_mt" {
  file_system_id = aws_efs_file_system.main_efs.id
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]

  security_groups = var.efs_security_group
}

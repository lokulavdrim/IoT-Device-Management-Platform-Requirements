resource "aws_iam_policy" "efs_access" {
  name        = "EFSAccessPolicy"
  description = "Policy to allow EC2 instances to access EFS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "elasticfilesystem:ClientMount"
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "elasticfilesystem:ClientWrite"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "ec2_efs_role" {
  name = "EC2EFSRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "efs_attach" {
  role       = aws_iam_role.ec2_efs_role.name
  policy_arn = aws_iam_policy.efs_access.arn
}

resource "aws_iam_instance_profile" "ec2_efs_profile" {
  name = "EC2EFSInstanceProfile"
  role = aws_iam_role.ec2_efs_role.name
}

resource "aws_launch_template" "main_launch_template" {
  name          = "main-launch-template"
  image_id      = "ami-0fc3317b37c1269d3"
  instance_type = "t3.micro"

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_efs_profile.name
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.ec2_security_group
  }

  user_data = base64encode(<<EOF
  #!/bin/bash
  # Install the Amazon EFS helper
  yum install -y amazon-efs-utils
  # Mount the EFS file system
  mkdir /mnt/efs
  mount -t efs -o tls ${var.aws_efs_file_system_id}:/ /mnt/efs
  # Ensure the EFS file system mounts on reboot
  echo "${var.aws_efs_file_system_id}:/ /mnt/efs efs defaults,_netdev 0 0" >> /etc/fstab
  EOF
  )

  monitoring {
    enabled = true
  }
}

resource "aws_autoscaling_group" "main_autoscaling_group" {
  name = "main-autoscaling-group"

  launch_template {
    id      = aws_launch_template.main_launch_template.id
    version = "$Latest"
  }

  min_size         = 1
  max_size         = 2
  desired_capacity = 1

  vpc_zone_identifier = var.public_subnet_ids
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "main-autoscaling-group-instance"
    propagate_at_launch = true
  }
}

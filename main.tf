module "VPC" {
  source   = "./modules/VPC"
}

module "ec2" {
  source          = "./modules/ec2"
  vpc_id          = module.VPC.vpc_id
  public_subnet_ids  = module.VPC.public_subnet_ids
  ec2_security_group = [module.SecurityGroups.ec2_security_group]
  aws_efs_file_system_id = module.EFS.aws_efs_file_system_id
  target_group_arn   = module.ALB.target_group_arn
}

module "RDS" {
  source   = "./modules/RDS"
  vpc_id   = module.VPC.vpc_id
  private_subnet_ids = module.VPC.private_subnet_ids
}

module "EFS" {
  source   = "./modules/EFS"
  efs_security_group = [module.SecurityGroups.efs_security_group]
  vpc_id = module.VPC.vpc_id
  public_subnet_ids = module.VPC.public_subnet_ids
}

module "S3" {
  source   = "./modules/S3"
}

module "ALB" {
  source             = "./modules/ALB"
  alb_security_group = [module.SecurityGroups.alb_security_group]
  vpc_id = module.VPC.vpc_id
  public_subnets     = module.VPC.public_subnet_ids
}

module "Bastion" {
  source   = "./modules/Bastion"
  bastion_security_group = [module.SecurityGroups.bastion_security_group]
  vpc_id = module.VPC.vpc_id
  public_subnets = module.VPC.public_subnet_ids[0]
}

module "dynamoDB" {
  source   = "./modules/dynamoDB"
}

module "CloudWatch" {
  source   = "./modules/CloudWatch"
  autoscaling_group_name = module.ec2.aws_autoscaling_group_name
}

module "Lambda" {
  source   = "./modules/Lambda"
}

module "SecurityGroups" {
  source   = "./modules/SecurityGroups"
  vpc_id   = module.VPC.vpc_id
}

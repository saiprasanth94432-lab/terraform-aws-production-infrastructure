module "vpc" {
  source = "./modules/vpc"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  project_name = local.project_name
  common_tags  = local.common_tags

}

module "security_group" {

  source        = "./modules/security-group"
  project_name  = local.project_name
  environment   = var.environment
  vpc_id        = module.vpc.vpc_id
  allowed_ports = var.allowed_ports
  common_tags   = local.common_tags
}

module "ec2" {
  source               = "./modules/ec2"
  project_name         = local.project_name
  ami_id               = data.aws_ami.amazon_linux.id
  environment          = var.environment
  instance_type        = "t2.micro"
  subnet_id            = module.vpc.public_subnet_ids[0]
  security_group_id    = module.security_group.security_group_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  common_tags          = local.common_tags


}



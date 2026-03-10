resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-web-server"
    environment = var.environment
  
  })
}
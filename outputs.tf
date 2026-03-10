output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id

}
output "public_subnet_ids" {
  description = "Public Subnets IDs"
  value       = module.vpc.public_subnet_ids
}

output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.ec2.public_ip
}
output "test_db_password" {
  value     = var.db_password
  sensitive = true
}
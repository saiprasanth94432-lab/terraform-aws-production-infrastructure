locals {
  project_name = "terraform-aws-production-infrastructure"

  
  common_tags = {
    Project     = "terraform-aws-production-infrastructure"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
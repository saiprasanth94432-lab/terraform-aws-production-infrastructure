variable "project_name" {
  type = string
}

variable "subnet_id" {
  description = "Subnet where EC2 will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security group for EC2"
  type        = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}

variable "common_tags" {
  type = map(string)
}
variable "environment" {
  type = string
  
}
variable "region" {
  description = "AWS region"
  type        = string


}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "The VPC CIDR must be  a valid CIDR block "
  }

}
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRS"
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) > 0
    error_message = "You must provide at least one public subnet CIDR."
  }
}
variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRS"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) > 0
    error_message = "You must provide at least one private subnet CIDR."
  }

}
variable "allowed_ports" {
  description = "Allowed  ports for security groups"
  type        = list(number)
  default     = [22, 80, 443]

  validation {
    condition     = length(var.allowed_ports) > 0
    error_message = "At least one port must be provided."
  }
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true

}
variable "environment" {
  description = "Deployment environment"
  type        = string

}
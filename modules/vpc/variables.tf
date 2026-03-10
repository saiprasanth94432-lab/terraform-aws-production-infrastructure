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
variable "project_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
variable "environment" {
  description = "Environment of vpc"
  type = string
  
}
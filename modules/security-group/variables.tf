variable "allowed_ports" {
  description = "Allowed  ports for security groups"
  type        = list(number)
  default     = [22, 80, 443]

  validation {
    condition     = length(var.allowed_ports) > 0
    error_message = "At least one port must be provided."
  }
}

variable "vpc_id" {
  description = "VPC where security group will be created"
  type        = string
}


variable "common_tags" {
  type = map(string)
}

variable "project_name" {
  type = string
}
variable "environment" {
  type = string
  
}
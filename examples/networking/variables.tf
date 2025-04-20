variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_azs" {
  description = "AZs for public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_azs" {
  description = "AZs for private subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {
    Environment = var.environment
  }
}

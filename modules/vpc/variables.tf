variable "cidr_block" {
  description = "Primary VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_azs" {
  description = "List of AZs for public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_azs" {
  description = "List of AZs for private subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "name_prefix" {
  description = "Name prefix for resources (e.g., environment)"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}

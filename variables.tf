variable "aws_region" {
  description = "the region where our PoV will be deployed"
  type        = "string"
  default     = "eu-west-2"
}

variable "availability_zones" {
  description = "A list AZs the vault cluster will be deployed into"
  type        = "list"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = "string"
  default     = "pov-vpc"
}

variable "public_subnets" {
  description = "A list public subnet cidr blocks"
  type        = "list"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "A list private subnets the vault cluster will be deployed into"
  type        = "list"
  default     = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
}
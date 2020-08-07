variable "name_preffix" {
  type        = string
  description = "Name preffix for resources on AWS"
}

variable "availability_zones" {
  type        = list
  description = "List of availability zones to be used by subnets"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_cidrs_per_availability_zone" {
  type        = list
  description = "List of CIDRs to use on each availability zone for private subnets"
  default     = ["192.168.0.0/19", "192.168.32.0/19"]
}

variable "private_subnets_cidrs_per_availability_zone" {
  type        = list
  description = "List of CIDRs to use on each availability zone for public subnets"
  default     = ["192.168.128.0/19", "192.168.160.0/19"]
}

variable "vpc_cidr_block" {
  type        = string
  description = "AWS VPC CIDR Block"
  default     = "192.168.0.0/16"
}

variable "enable_public_lb" {
  type        = bool
  description = "Enable/Disable public lb in the network"
  default     = false
}

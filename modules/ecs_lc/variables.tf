variable "name_preffix" {
  type        = string
  description = "Name preffix for resources on AWS"
}

variable "image_id" {
  description = "Amazon ECS-Optimized AMI."
  type        = string
  default     = "ami-007cd1678c6286a05"
}

variable "instance_type" {
  description = "The instance type to use."
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "The id of the VPC to launch resources in."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}

variable "enable_autoscaling" {
  type = bool
  description = "Enable autoscaling of number of ec2 whithin the cluster."
  default = false
}

variable "desired_capacity" {
  description = "Desired instance count."
  type        = string
  default     = 3
}

variable "max_size" {
  description = "Maxmimum instance count."
  type        = string
  default     = 5
}

variable "min_size" {
  description = "Minimum instance count."
  type        = string
  default     = 1
}

variable "use_AmazonEC2ContainerServiceforEC2Role_policy" {
  description = "Attaches the AWS managed AmazonEC2ContainerServiceforEC2Role policy to the ECS instance role."
  type        = string
  default     = true
}

variable "security_group_ids" {
  description = "A list of security group ids to attach to the autoscaling group"
  type        = list(string)
  default     = []
}

# Variables definition

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Project name to use in resource names"
  type        = string
  default     = "pnpm-workspace-app"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones to use for subnets"
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instances (if empty, latest Amazon Linux 2023 will be used)"
  type        = string
  default     = ""
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t3.micro"
}

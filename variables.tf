variable "region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "us-east-1"
  
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
  
}

variable "subnet_cidr" {
    description = "CIDR block for the subnet"
    type        = string
  
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
  
}

variable "key_name" {
    description = "Name of the SSH key pair to access EC2 instances"
    type        = string
  
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
  
}

variable "volume_size" {
    description = "Size of the EBS volume in GB"
    type        = number
  
}


variable "region" {
  type        = string
  description = "The AWS region that infrastructure will be deployed in"
}

variable "subnet_private_id" {
  type        = string
  description = "Subnet ID for EC2 instance in AZ 1a"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC "
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  type = string
}


variable "aws_key_name" {
  type        = string
  description = "aws ec2 key name used to authenticate onto jump server"
}

variable "ami_id" {
  type = string
}

variable "jump_host_cidr_list" {
  description = "cidr block allowed to ssh and browse to jenkins server"
  type        = list(any)
}

variable "app_env" {
  type = string
}

variable "project" {
  type = string
}

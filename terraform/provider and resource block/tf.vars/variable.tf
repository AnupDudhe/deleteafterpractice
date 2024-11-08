# main.tf

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type        = string
}

variable "prefix" {
  description = "Prefix which will be appended to the name tag of the resources created."
}

variable "vpc_id" {
  description = "ID of the VPC where the ECS resources will be placed."
}

variable "image_id" {
  description = "ID of the AMI which will be used to create your ECS instances."
}

variable "instance_type" {
  description = "Instance type which will be used to created your ECS instances."
}

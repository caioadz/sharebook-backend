variable "prefix" {
  description = "Prefix that will be appended to the Name tag of the Resources created."
}

variable "cidr_block" {
  description = "CIDR block of the VPC that will be created."
}

variable "availability_zone_count" {
  description = "Number of availability zones you want to distribute your subnets. 0 for all availability zones whitin the region."
}

variable "image_id" {
  description = "ID of the AMI which will be used to create your ECS instances."
}

variable "instance_type" {
  description = "Instance type which will be used to created your ECS instances."
}

variable "desired_capacity" {
  description = "The number of instances the cluster should have at any time."
}

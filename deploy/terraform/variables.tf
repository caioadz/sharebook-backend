variable "service_name" {
  description = "An unique name that identifies your service. This will be used as prefix for many AWS resources."
  default     = "sharebook"
}

variable "environment" {
  description = "Environment name."
  default     = "prod"
}

variable "cidr_block" {
  description = "CIDR block of the VPC that will be created."
  default     = "10.0.0.0/16"
}

variable "availability_zone_count" {
  description = "Number of availability zones you want to distribute your subnets. 0 for all availability zones whitin the region."
  default     = 2
}

variable "image_id" {
  description = "ID of the AMI which will be used to create your ECS instances."
  default     = "ami-0be9e1908fe51a590"
}

variable "instance_type" {
  description = "Instance type which will be used to created your ECS instances."
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "The number of instances the cluster should have at any time."
  default     = 1
}

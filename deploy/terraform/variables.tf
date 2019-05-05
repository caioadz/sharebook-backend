variable "organization" {
  description = "Name of your organization"
  default     = "sharebook"
}

variable "service_name" {
  description = "An unique name that identifies your service. This will be used as prefix for many AWS resources."
  default     = "backend"
}

variable "environment" {
  description = "Environment name."
  default     = "prod"
}

#####################
# INFRASTRUCTURE
#####################

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

variable "desired_task_count" {
  description = "Number of tasks you want to keep running on your service."
  default     = 1
}

#####################
# INFRASTRUCTURE
#####################

variable "image_tag" {
  description = "Tag applied to the image."
  default     = "master"
}

variable "container_cpu" {
  description = "The number of cpu units reserved for the container."
  default     = 0
}

variable "container_memory" {
  description = "The hard limit (in MiB) of memory to present to the container."
  default     = 128
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer."
  default     = 80
}

variable "container_hostPort" {
  description = "The port on the host to associate with the container port."
  default     = 0
}

variable "container_protocol" {
  description = "The protocol on the container to associate with the load balancer."
  default     = "tcp"
}

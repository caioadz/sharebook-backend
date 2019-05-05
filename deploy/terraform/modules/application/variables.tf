variable "service_name" {
  description = "An unique name that identifies your service. This will be used as prefix for many AWS resources."
}

variable "environment" {
  description = "Environment name."
}

variable "image_tag" {
  description = "Tag applied to the image."
}

variable "container_cpu" {
  description = "The number of cpu units reserved for the container."
}

variable "container_memory" {
  description = "The hard limit (in MiB) of memory to present to the container."
  default     = 0
}

variable "container_memoryReservation" {
  description = "The soft limit (in MiB) of memory to reserve for the container."
  default     = 0
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer."
}

variable "container_protocol" {
  description = "The protocol on the container to associate with the load balancer."
}

############################################################################
# VARIABLES THAT SHOULD BE REFACTORED INTO DATASOURCES FILTERING FROM TAGS
############################################################################

variable "vpc_id" {
  description = "ID of the VPC where your resources will be placed."
}

variable "lb_security_group_ids" {
  type        = "list"
  description = "Security group where your Load Balancer should be placed."
}

variable "lb_subnet_ids" {
  type        = "list"
  description = "ID of the subnets where you want to place your load balancer."
}

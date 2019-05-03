variable "name" {
  description = "Name of the load balancer which will be created."
}

variable "load_balancer_type" {
  description = "Configure whether this will be an application or network load balancer."
  default     = "application"
}

variable "security_groups" {
  type        = "list"
  description = "Assign one or more security groups to this load balancer."
}

variable "subnet_ids" {
  type        = "list"
  description = "A list of subnets to attach to the load balancer."
}

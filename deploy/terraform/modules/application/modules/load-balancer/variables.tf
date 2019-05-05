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

variable "listeners" {
  type        = "list"
  description = "A listener is a process that checks for connection requests, using the protocol and port that you configured."
}

variable "target_type" {
  default     = "instance"
  description = "The type of target that you must specify when registering targets with this target group."
}

variable "target_port" {
  description = "The port on which targets receive traffic."
}

variable "target_protocol" {
  description = " The protocol to use for routing traffic to the targets. Should be one of TCP, TLS, HTTP or HTTPS."
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group."
}

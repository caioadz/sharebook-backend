variable "service_name" {
  description = "An unique name that identifies your service. This will be used as prefix for many AWS resources."
}

variable "environment" {
  description = "Environment name."
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

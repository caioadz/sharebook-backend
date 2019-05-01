variable "name" {
  description = "Name tag of the Security Group that will be created."
}

variable "description" {
  description = "Description for your Security Group."
}

variable "vpc_id" {
  description = "ID of the VPC where this Security Group will be created."
}

variable "ingress_with_cidr_blocks" {
  type        = "list"
  description = "List of the ingress rules by CIDR blocks."
  default     = []
}

variable "ingress_with_source_security_group_id" {
  type        = "list"
  description = "List of the ingress rules by Security Group ID."
  default     = []
}

variable "egress_with_cidr_blocks" {
  type        = "list"
  description = "List of the egress rules by CIDR blocks."
  default     = []
}

variable "egress_with_source_security_group_id" {
  type        = "list"
  description = "List of the egress rules by Security Group ID."
  default     = []
}

variable "name" {
  description = "Name tag of the Security Group that will be created."
}

variable "description" {
  description = "Description for your Security Group."
}

variable "vpc_id" {
  description = "ID of the VPC where this Security Group will be created."
}

###################################
# INGRESS
###################################

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

###################################
# EGRESS
###################################

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

###################################
# COMPUTED INGRESS
###################################

variable "computed_ingress_with_cidr_blocks" {
  type        = "list"
  description = "List of the ingress rules by CIDR blocks."
  default     = []
}

variable "computed_ingress_with_source_security_group_id" {
  type        = "list"
  description = "List of the ingress rules by Security Group ID."
  default     = []
}

###################################
# NUMBER OF COMPUTED INGRESS
###################################

variable "computed_ingress_with_cidr_blocks_count" {
  description = "Number of computed ingress rules by CIDR blocks."
  default     = 0
}

variable "computed_ingress_with_source_security_group_id_count" {
  description = "Number of computed ingress rules by Security Group ID."
  default     = 0
}

###################################
# COMPUTED EGRESS
###################################

variable "computed_egress_with_cidr_blocks" {
  type        = "list"
  description = "List of the egress rules by CIDR blocks."
  default     = []
}

variable "computed_egress_with_source_security_group_id" {
  type        = "list"
  description = "List of the egress rules by Security Group ID."
  default     = []
}

###################################
# NUMBER OF COMPUTED EGRESS
###################################

variable "computed_egress_with_cidr_blocks_count" {
  description = "Number of computed egress rules by CIDR blocks."
  default     = 0
}

variable "computed_egress_with_source_security_group_id_count" {
  description = "Number of computed egress rules by Security Group ID."
  default     = 0
}
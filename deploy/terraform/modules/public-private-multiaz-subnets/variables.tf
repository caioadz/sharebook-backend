variable "prefix" {
  description = "Prefix that will be appended to the Name tag of the Resources created."
}

variable "vpc_id" {
  description = "ID of the VPC where this Subnet will be available."
}

variable "availability_zone_count" {
  description = "Number of availability zones you want to distribute your subnets. 0 for all availability zones whitin the region."
  default = 0
}

variable "consume_full_range" {
  description = "true: The VPC range will be consumed by the Subnets that will be created; false: The VPC range will be distributed equally between all AZs (2 subnets per AZ), even if youre not deploying for all of them (availability_zone_count < zones available)."
  default = false
}

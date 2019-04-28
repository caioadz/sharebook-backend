variable "prefix" {
  description = "Prefix that will be appended to the Name tag of the Resources created."
}

variable "vpc_id" {
  description = "ID of the VPC where this Subnet will be available."
}

variable "availability_zone_count" {
  description = "Number of availability zones you want to distribute your subnets. 0 for all availability zones from the region."
  default = 0
}
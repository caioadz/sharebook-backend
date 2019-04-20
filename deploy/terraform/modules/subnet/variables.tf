variable "name" {
  description = "Name tag of the Subnet that will be created."
}

variable "vpc_id" {
  description = "ID of the VPC where this Subnet will be available."
}

variable "cidr_block" {
  description = "CIDR block of the Subnet that will be created."
}

variable "availability_zone" {
  description = "Availability Zone where this Subnet will reside."
}
variable "prefix" {
  description = "Prefix that will be appended to the Name tag of the Subnets."
}

variable "vpc_id" {
  description = "ID of the VPC where this Subnet will be available."
}


variable "cidr_block_public_subnet_1" {
  description = "CIDR block of the Subnet that will be created (PUBLIC SUBNET 1)"
}

variable "cidr_block_public_subnet_2" {
  description = "CIDR block of the Subnet that will be created (PUBLIC SUBNET 2)"
}

variable "cidr_block_private_subnet_1" {
  description = "CIDR block of the Subnet that will be created (PRIVATE SUBNET 1)"
}

variable "cidr_block_private_subnet_2" {
  description = "CIDR block of the Subnet that will be created (PRIVATE SUBNET 2)"  
}
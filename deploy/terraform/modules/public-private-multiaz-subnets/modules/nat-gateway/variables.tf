variable "name" {
  description = "Name tag of the resources that will be created."
}


variable "subnet_ids" {
  type = "list"
  description = "List of public subnets where you want to assign your NAT Gateways."  
}

variable "subnet_count" {
  description = "Number of items contained in subnet_ids. Hack: Terraform doesnt allow computed values to be used with count."
}

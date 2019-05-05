output "vpc_arn" {
  value = "${module.vpc_with_internet_gateway.vpc_arn}"
}

output "vpc_id" {
  value = "${module.vpc_with_internet_gateway.vpc_id}"
}

output "public_subnet_ids" {
  description = "AWS IDs of the created public subnets"
  value       = "${module.public_private_multiaz_subnets.public_subnet_ids}"
}

output "private_subnet_ids" {
  description = "AWS IDs of the created private subnets"
  value       = ["${module.public_private_multiaz_subnets.private_subnet_ids}"]
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the created public subnets"
  value       = "${module.public_private_multiaz_subnets.public_subnet_cidrs}"
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of the created private subnets"
  value       = "${module.public_private_multiaz_subnets.private_subnet_cidrs}"
}

output "nat_gateway_public_ips" {
  description = "NAT gateways Public IPs"
  value       = "${module.public_private_multiaz_subnets.nat_gateway_public_ips}"
}

output "availability_zones" {
  description = "List of Availability Zones where subnets were created"
  value       = "${module.public_private_multiaz_subnets.availability_zones}"
}

output "lb_security_group_id" {
  value = "${module.ecs_cluster.lb_security_group_id}"
}

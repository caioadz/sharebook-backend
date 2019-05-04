output "ecr_repository_arn" {
  value = "${module.application.ecr_repository_arn}"
}

output "ecr_repository_url" {
  value = "${module.application.ecr_repository_url}"
}

output "vpc_arn" {
  value = "${module.infrastructure.vpc_arn}"
}

output "vpc_id" {
  value = "${module.infrastructure.vpc_id}"
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the created public subnets"
  value       = "${module.infrastructure.public_subnet_cidrs}"
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of the created private subnets"
  value       = "${module.infrastructure.private_subnet_cidrs}"
}

output "nat_gateway_public_ips" {
  description = "NAT gateways Public IPs"
  value       = "${module.infrastructure.nat_gateway_public_ips}"
}

output "availability_zones" {
  description = "List of Availability Zones where subnets were created"
  value       = "${module.infrastructure.availability_zones}"
}

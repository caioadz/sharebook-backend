output "public_subnet_ids" {
  description = "AWS IDs of the created public subnets"
  value       = ["${aws_subnet.public.*.id}"]
}

output "private_subnet_ids" {
  description = "AWS IDs of the created private subnets"
  value       = ["${aws_subnet.private.*.id}"]
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the created public subnets"
  value       = ["${aws_subnet.public.*.cidr_block}"]
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of the created private subnets"
  value       = ["${aws_subnet.private.*.cidr_block}"]
}

output "nat_gateway_ids" {
  description = "AWS IDs of the NAT gateways created"
  value       = ["${module.nat_gateway.ids}"]
}

output "nat_gateway_public_ips" {
  description = "NAT gateways Public IPs"
  value       = ["${module.nat_gateway.public_ips}"]
}

output "availability_zones" {
  description = "List of Availability Zones where subnets were created"
  value       = ["${aws_subnet.public.*.availability_zone}"]
}

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
  value       = ["${aws_nat_gateway.nat_gateway.*.id}"]
}

output "nat_gateway_public_ips" {
  description = "NAT gateways Public IPs"
  value       = ["${aws_nat_gateway.nat_gateway.*.public_ip}"]
}

output "availability_zones" {
  description = "List of Availability Zones where subnets were created"
  value       = ["${aws_subnet.public.*.availability_zone}"]
}
output "ids" {
  description = "AWS IDs of the NAT gateways created"
  value       = ["${aws_nat_gateway.nat_gateway.*.id}"]
}

output "public_ips" {
  description = "NAT gateways Public IPs"
  value       = ["${aws_nat_gateway.nat_gateway.*.public_ip}"]
}

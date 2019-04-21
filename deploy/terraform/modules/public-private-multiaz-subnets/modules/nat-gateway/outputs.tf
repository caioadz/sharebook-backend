output "id" {
  value = "${aws_nat_gateway.nat_gateway.id}"
}

output "allocation_id" {
  value = "${aws_nat_gateway.nat_gateway.allocation_id}"
}

output "public_ip" {
  value = "${aws_nat_gateway.nat_gateway.public_ip}"
}

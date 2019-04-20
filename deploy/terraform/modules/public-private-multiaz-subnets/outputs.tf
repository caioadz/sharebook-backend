output "arn_public_subnet_1" {
  value = "${module.public_subnet_1.arn}"
}

output "id_public_subnet_2" {
  value = "${module.public_subnet_2.id}"
}

output "arn_private_subnet_1" {
  value = "${module.private_subnet_1.arn}"
}

output "id_private_subnet_2" {
  value = "${module.private_subnet_2.id}"
}

output "availability_zone_1" {
  value = "${data.aws_availability_zones.availability_zones.names[0]}"
}

output "availability_zone_2" {
  value = "${data.aws_availability_zones.availability_zones.names[1]}"
}


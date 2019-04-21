output "ecr_repository_arn" {
  value = "${module.ecr_repository.arn}"
}

output "ecr_repository_url" {
  value = "${module.ecr_repository.repository_url}"
}
output "vpc_arn" {
  value = "${module.vpc_with_internet_gateway.vpc_arn}"
}

output "vpc_id" {
  value = "${module.vpc_with_internet_gateway.vpc_id}"
}

output "internet_gateway_id" {
  value = "${module.vpc_with_internet_gateway.internet_gateway_id}"
}

output "availability_zone_1" {
  value = "${module.public_private_multiaz_subnets.availability_zone_1}"
}

output "availability_zone_2" {
  value = "${module.public_private_multiaz_subnets.availability_zone_2}"
}

output "public_ip_1" {
  value = "${module.public_private_multiaz_subnets.public_ip_1}"
}

output "public_ip_2" {
  value = "${module.public_private_multiaz_subnets.public_ip_2}"
}
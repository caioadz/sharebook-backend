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

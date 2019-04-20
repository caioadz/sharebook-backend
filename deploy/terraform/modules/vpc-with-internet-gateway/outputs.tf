output "vpc_arn" {
  value = "${module.vpc.arn}"
}

output "vpc_id" {
  value = "${module.vpc.id}"
}

output "internet_gateway_id" {
  value = "${module.internet_gateway.id}"
}

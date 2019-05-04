output "ecr_repository_arn" {
  value = "${module.ecr_repository.arn}"
}

output "ecr_repository_url" {
  value = "${module.ecr_repository.repository_url}"
}

output "alb_id" {
  value = "${module.load_balancer.id}"
}

output "alb_dns_name" {
  value = "${module.load_balancer.dns_name}"
}

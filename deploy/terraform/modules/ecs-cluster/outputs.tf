output "alb_security_group_id" {
  value = "${module.alb_security_group.id}"
}

output "alb_id" {
  value = "${module.load_balancer.id}"
}

output "alb_dns_name" {
  value = "${module.load_balancer.dns_name}"
}
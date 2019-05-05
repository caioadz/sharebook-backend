output "arn" {
  value = "${aws_ecs_cluster.ecs_cluster.arn}"
}

output "lb_security_group_id" {
  value = "${module.lb_security_group.id}"
}

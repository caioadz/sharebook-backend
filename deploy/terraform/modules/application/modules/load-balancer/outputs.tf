output "id" {
  value = "${aws_lb.lb.id}"
}

output "arn" {
  value = "${aws_lb.lb.arn}"
}

output "dns_name" {
  value = "${aws_lb.lb.dns_name}"
}

output "target_group_arn" {
  value = "${aws_lb_target_group.lb_target_group.arn}"
}

output "target_group_id" {
  value = "${aws_lb_target_group.lb_target_group.id}"
}

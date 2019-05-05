output "arn" {
  value = "${aws_ecs_task_definition.ecs_task_definition.arn}"
}

output "family" {
  value = "${aws_ecs_task_definition.ecs_task_definition.family}"
}

output "revision" {
  value = "${aws_ecs_task_definition.ecs_task_definition.revision}"
}

output "container_name" {
  value = "${var.container_name}"
}

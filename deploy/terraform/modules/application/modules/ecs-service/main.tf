resource "aws_ecs_service" "ecs_service" {
  name = "${var.name}"

  cluster         = "${var.cluster_arn}"
  task_definition = "${var.task_definition}"
  desired_count   = "${var.desired_count}"

  load_balancer {
    target_group_arn = "${var.target_group_arn}"
    container_name   = "${var.container_name}"
    container_port   = "${var.container_port}"
  }
}

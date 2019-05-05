locals {
  prefix = "${var.service_name}-${var.environment}"
}

module "ecr_repository" {
  source = "./modules/ecr-repository"

  repository_name = "${var.service_name}"
}

module "load_balancer" {
  source = "./modules/load-balancer"

  name            = "${local.prefix}"
  security_groups = "${var.lb_security_group_ids}"
  subnet_ids      = "${var.lb_subnet_ids}"

  target_type     = "instance"
  target_port     = 80
  target_protocol = "HTTP"
  vpc_id          = "${var.vpc_id}"

  listeners = [
    {
      port     = 80
      protocol = "HTTP"
    },
  ]
}

module "ecs_task_definition" {
  source = "./modules/ecs-task-definition"

  family = "${local.prefix}"

  container_name              = "${local.prefix}"
  container_cpu               = "${var.container_cpu}"
  container_memory            = "${var.container_memory}"
  container_memoryReservation = "${var.container_memoryReservation}"
  container_image             = "${module.ecr_repository.repository_url}:${var.image_tag}"

  container_portMappings = [
    {
      containerPort = "${var.container_port}"
      hostPort      = "${var.container_hostPort}"
      protocol      = "${var.container_protocol}"
    },
  ]
}

module "ecs_service" {
  source = "./modules/ecs-service"

  name           = "${local.prefix}"
  cluster_arn    = "${var.ecs_cluster_arn}"
  desired_count  = "${var.desired_task_count}"
  container_port = "${var.container_port}"

  task_definition  = "${module.ecs_task_definition.arn}"
  container_name   = "${module.ecs_task_definition.container_name}"
  target_group_arn = "${module.load_balancer.target_group_arn}"
}

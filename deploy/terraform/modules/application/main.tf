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
      protocol      = "${var.container_protocol}"
    },
  ]
}

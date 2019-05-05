locals {
  prefix = "${var.service_name}-${var.environment}"
}

module "ecr_repository" {
  source = "./modules/ecr-repository"

  repository_name = "${var.service_name}"
}

module "load_balancer" {
  source = "./modules/load-balancer"
  
  name = "${local.prefix}"
  security_groups = "${var.lb_security_group_ids}"
  subnet_ids = "${var.lb_subnet_ids}"

  target_type = "instance"
  target_port = 80
  target_protocol = "HTTP"
  vpc_id = "${var.vpc_id}"

  listeners = [
    {
      port = 80,
      protocol = "HTTP"
    }
  ]
}

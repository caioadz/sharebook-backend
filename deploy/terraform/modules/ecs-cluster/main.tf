module "default_instance_role" {
  source = "./modules/default-instance-role"

  prefix = "${var.prefix}"
}

module "alb_security_group" {
  source = "./modules/security-group"
  
  name = "${var.prefix}-alb"
  description = "Security Group with rules for our Application Load Balancer"
  vpc_id = "${var.vpc_id}"

  ingress_with_cidr_blocks = [
    {
      from_port = 80,
      to_port = 80,
      protocol = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "ecs_security_group" {
  source = "./modules/security-group"
  
  name = "${var.prefix}-ecs"
  description = "Security Group with rules for our ECS instances"
  vpc_id = "${var.vpc_id}"

  computed_ingress_with_source_security_group_id = [
    {
      from_port = 0,
      to_port = 0,
      protocol = "all"
      source_security_group_id = "${module.alb_security_group.id}"
    }
  ]

  computed_ingress_with_source_security_group_id_count = 1
}

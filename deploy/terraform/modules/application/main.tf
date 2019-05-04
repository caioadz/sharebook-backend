module "load_balancer" {
  source = "./modules/load-balancer"
  
  name = "${var.prefix}"
  security_groups = ["${module.alb_security_group.id}"]
  subnet_ids = "${var.lb_subnets}"

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

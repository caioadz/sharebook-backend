resource "aws_lb" "lb" {
  name               = "${var.name}"
  load_balancer_type = "${var.load_balancer_type}"
  security_groups    = ["${var.security_groups}"]
  subnets            = ["${var.subnet_ids}"]
}
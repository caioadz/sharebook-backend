resource "aws_lb" "lb" {
  name               = "${var.name}"
  load_balancer_type = "${var.load_balancer_type}"
  security_groups    = ["${var.security_groups}"]
  subnets            = ["${var.subnet_ids}"]
}

resource "aws_lb_listener" "lb_listener" {
  count = "${length(var.listeners)}"

  load_balancer_arn = "${aws_lb.lb.arn}"

  port     = "${lookup(var.listeners[count.index], "port")}"
  protocol = "${lookup(var.listeners[count.index], "protocol")}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.lb_target_group.arn}"
  }
}

resource "aws_lb_target_group" "lb_target_group" {
  name = "${var.name}"

  target_type = "${var.target_type}"
  port        = "${var.target_port}"
  protocol    = "${var.target_protocol}"

  vpc_id = "${var.vpc_id}"
}

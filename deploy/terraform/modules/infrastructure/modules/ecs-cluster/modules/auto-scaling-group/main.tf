resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = "${var.name}"
  desired_capacity          = "${var.desired_capacity}"
  max_size                  = "${var.desired_capacity}"
  min_size                  = "${var.desired_capacity}"
  health_check_grace_period = "${var.health_check_grace_period}"
  launch_configuration      = "${var.launch_configuration}"
  vpc_zone_identifier       = ["${var.vpc_zone_identifier}"]
}

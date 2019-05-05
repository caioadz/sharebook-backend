resource "aws_launch_configuration" "launch_configuration" {
  name_prefix                 = "${var.name_prefix}-"
  image_id                    = "${var.image_id}"
  iam_instance_profile        = "${var.iam_instance_profile}"
  instance_type               = "${var.instance_type}"
  security_groups             = ["${var.security_groups}"]
  user_data                   = "${var.user_data}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  lifecycle {
    create_before_destroy = true
  }
}

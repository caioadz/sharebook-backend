data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_role" {
  name               = "${var.prefix}-DefaultInstanceRole"
  description        = "Role used by ECS Instances with permissions needed to access the ECS Cluster and other basic services."
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "${aws_iam_role.iam_role.name}"
  role = "${aws_iam_role.iam_role.name}"
}

resource "aws_iam_role_policy_attachment" "attach_ssm_policy" {
  role       = "${aws_iam_role.iam_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "attach_ecs_policy" {
  role       = "${aws_iam_role.iam_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

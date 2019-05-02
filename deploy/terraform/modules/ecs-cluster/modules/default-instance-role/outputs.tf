output "arn" {
  value = "${aws_iam_role.iam_role.arn}"
}

output "name" {
  value = "${aws_iam_role.iam_role.name}"
}

output "instance_profile_name" {
  value = "${aws_iam_instance_profile.iam_instance_profile.name}"
}

output "ssm_policy_arn" {
  value = "${aws_iam_role_policy_attachment.attach_ssm_policy.policy_arn}"
}

output "ecs_policy_arn" {
  value = "${aws_iam_role_policy_attachment.attach_ecs_policy.policy_arn}"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.prefix}"
}

module "default_instance_role" {
  source = "./modules/default-instance-role"

  prefix = "${var.prefix}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE DEFAULT SECURITY GROUP
# ---------------------------------------------------------------------------------------------------------------------

module "alb_security_group" {
  source = "../../../security-group"
  
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
  source = "../../../security-group"
  
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

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

module "launch_configuration" {
  source = "./modules/launch-configuration"

  name_prefix   = "${var.prefix}-lc"
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"

  iam_instance_profile = "${module.default_instance_role.instance_profile_name}"
  security_groups = ["${module.ecs_security_group.id}"]

  user_data = <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${aws_ecs_cluster.ecs_cluster.name} >> /etc/ecs/ecs.config;echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;

    # Install JQ JSON parser
    yum install -y jq

    # Get the current region from the instance metadata
    region=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)

    # Install the SSM agent RPM
    yum install -y https://amazon-ssm-$region.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm
  EOF
}

module "auto_scaling" {
  source = "./modules/auto-scaling-group"
  
  name                 = "${var.prefix}-as"
  desired_capacity     = "${var.desired_capacity}"
  launch_configuration = "${module.launch_configuration.id}"
  vpc_zone_identifier  = "${var.instance_subnets}"
}

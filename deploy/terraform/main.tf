terraform {
  required_version = ">= 0.11.13"
}

provider "aws" {}

locals {
  prefix = "${var.service_name}-${var.environment}"
}

module "ecr_repository" {
  source = "./modules/ecr-repository"

  repository_name = "${var.service_name}"
}

module "vpc_with_internet_gateway" {
  source = "./modules/vpc-with-internet-gateway"

  vpc_name   = "${local.prefix}"
  cidr_block = "10.0.0.0/16"

  internet_gateway_name = "${local.prefix}"
}

module "public_private_multiaz_subnets" {
  source = "./modules/public-private-multiaz-subnets"

  prefix = "${local.prefix}"
  vpc_id = "${module.vpc_with_internet_gateway.vpc_id}"

  availability_zone_count = 2
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  prefix               = "${local.prefix}"
  vpc_id               = "${module.vpc_with_internet_gateway.vpc_id}"
  subnet_ids           = "${module.public_private_multiaz_subnets.public_subnet_ids}"
  lb_security_group_id = "${module.public_private_multiaz_subnets.alb_security_group_id}"

  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  desired_capacity = "${var.desired_capacity}"
}
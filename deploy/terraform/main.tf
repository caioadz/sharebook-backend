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

module "infrastructure" {
  source = "./modules/infrastructure"
  
  prefix = "${local.prefix}"
  cidr_block = "${var.cidr_block}"
  availability_zone_count = "${var.availability_zone_count}"
  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  desired_capacity = "${var.desired_capacity}"
}

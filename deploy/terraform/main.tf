terraform {
  required_version = ">= 0.11.13"
}

provider "aws" {}

module "infrastructure" {
  source = "./modules/infrastructure"
  
  prefix = "${var.organization}"
  cidr_block = "${var.cidr_block}"
  availability_zone_count = "${var.availability_zone_count}"
  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  desired_capacity = "${var.desired_capacity}"
}

module "application" {
  source = "./modules/application"
  
  service_name = "${var.service_name}"
  environment = "${var.environment}"
}

module "vpc" {
  source = "./modules/vpc"

  name = "${var.vpc_name}"
  cidr_block = "${var.cidr_block}"
}

module "internet_gateway" {
  source = "./modules/internet-gateway"

  name = "${var.internet_gateway_name}"
  vpc_id = "${module.vpc.id}"
}
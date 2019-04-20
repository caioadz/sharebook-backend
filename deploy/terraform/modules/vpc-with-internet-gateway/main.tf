module "vpc" {
  source = "../vpc"

  name = "${var.vpc_name}"
  cidr_block = "${var.cidr_block}"
}

module "internet_gateway" {
  source = "../internet-gateway"

  name = "${var.internet_gateway_name}"
  vpc_id = "${module.vpc.id}"
}
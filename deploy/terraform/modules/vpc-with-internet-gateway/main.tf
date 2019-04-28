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

resource "aws_route" "igw_route" {
  route_table_id         = "${module.vpc.default_route_table_id}"
  
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${module.internet_gateway.id}"
}

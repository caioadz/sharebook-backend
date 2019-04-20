data "aws_availability_zones" "availability_zones"
{
  state = "available"
}

module "public_subnet_1" {
  source = "../subnet"

  name = "${var.prefix}-public-1"
  cidr_block = "${var.cidr_block_public_subnet_1}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"
  assign_public_ip = "true"
}

module "public_subnet_2" {
  source = "../subnet"

  name = "${var.prefix}-public-2"
  cidr_block = "${var.cidr_block_public_subnet_2}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"
  assign_public_ip = "true"
}

module "private_subnet_1" {
  source = "../subnet"

  name = "${var.prefix}-private-1"
  cidr_block = "${var.cidr_block_private_subnet_1}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"
}

module "private_subnet_2" {
  source = "../subnet"

  name = "${var.prefix}-private-2"
  cidr_block = "${var.cidr_block_private_subnet_2}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"
}
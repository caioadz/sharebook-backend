data "aws_availability_zones" "availability_zones"
{
  state = "available"
}

locals {
  availability_zone_1 = "${data.aws_availability_zones.availability_zones.names[0]}"
  availability_zone_2 = "${data.aws_availability_zones.availability_zones.names[1]}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SET OF SUBNETS TO SUPPORT PUBLIC-PRIVATE MULTIAZ ARCHITECTURE
# ---------------------------------------------------------------------------------------------------------------------

module "public_subnet_1" {
  source = "./modules/subnet"

  name = "${var.prefix}-public-1"
  cidr_block = "${var.cidr_block_public_subnet_1}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${local.availability_zone_1}"
  assign_public_ip = "true"
}

module "public_subnet_2" {
  source = "./modules/subnet"

  name = "${var.prefix}-public-2"
  cidr_block = "${var.cidr_block_public_subnet_2}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${local.availability_zone_2}"
  assign_public_ip = "true"
}

module "private_subnet_1" {
  source = "./modules/subnet"

  name = "${var.prefix}-private-1"
  cidr_block = "${var.cidr_block_private_subnet_1}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${local.availability_zone_1}"
}

module "private_subnet_2" {
  source = "./modules/subnet"

  name = "${var.prefix}-private-2"
  cidr_block = "${var.cidr_block_private_subnet_2}"

  vpc_id = "${var.vpc_id}"
  availability_zone = "${local.availability_zone_2}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NAT GATEWAY FOR EACH PUBLIC SUBNET
# ---------------------------------------------------------------------------------------------------------------------

module "nat_gateway_1" {
  source = "./modules/nat-gateway"

  name = "${var.prefix}-1"
  subnet_id = "${module.public_subnet_1.id}"
}

module "nat_gateway_2" {
  source = "./modules/nat-gateway"

  name = "${var.prefix}-2"
  subnet_id = "${module.public_subnet_2.id}"
}
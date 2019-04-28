data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

locals {
  subnet_count   = "${var.availability_zone_count == 0 ? length(data.aws_availability_zones.available.names) : var.availability_zone_count}"
  vpc_cidr_block = "${data.aws_vpc.vpc.cidr_block}"
  range_consumed = "${var.consume_full_range == true ? local.subnet_count : length(data.aws_availability_zones.available.names)}"
  newbits        = "${ceil(log(local.range_consumed * 2, 2))}"
}

# ---------------------------------------------------------------------------------------------------------------------
# RANDOMIZE AVAILABILITY ZONES
# ---------------------------------------------------------------------------------------------------------------------

resource "random_shuffle" "availability_zones" {
  input        = ["${data.aws_availability_zones.available.names}"]
  result_count = "${local.subnet_count}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SET OF SUBNETS TO SUPPORT PUBLIC-PRIVATE MULTIAZ ARCHITECTURE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "private" {
  count = "${local.subnet_count}"

  vpc_id                  = "${var.vpc_id}"
  map_public_ip_on_launch = false

  cidr_block        = "${cidrsubnet(local.vpc_cidr_block, local.newbits, count.index)}"
  availability_zone = "${element(random_shuffle.availability_zones.result, count.index)}"

  tags {
    Name = "${var.prefix}-private-${count.index}"
  }
}

resource "aws_subnet" "public" {
  count = "${local.subnet_count}"

  vpc_id                  = "${var.vpc_id}"
  map_public_ip_on_launch = true

  cidr_block        = "${cidrsubnet(local.vpc_cidr_block, local.newbits, local.subnet_count + count.index)}"
  availability_zone = "${element(random_shuffle.availability_zones.result, count.index)}"

  tags {
    Name = "${var.prefix}-public-${count.index}"
  }
}

resource "aws_route_table" "private_route_table" {
  count = "${local.subnet_count}"

  vpc_id = "${var.vpc_id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${element(module.nat_gateway.ids, count.index)}"
  }

  tags {
    Name = "${var.prefix}-private-${count.index}"
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  count = "${local.subnet_count}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NAT GATEWAY FOR EACH PUBLIC SUBNET
# ---------------------------------------------------------------------------------------------------------------------

module "nat_gateway" {
  source = "./modules/nat-gateway"

  name       = "${var.prefix}"
  subnet_ids = "${aws_subnet.public.*.id}"

  subnet_count = "${local.subnet_count}"
}

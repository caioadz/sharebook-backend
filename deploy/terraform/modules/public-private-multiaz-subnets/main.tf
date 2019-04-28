data "aws_availability_zones" "availability_zones"
{
  state = "available"
}

data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

locals {
  subnet_count = "${var.availability_zone_count == 0 ? length(data.aws_availability_zones.availability_zones.names) : var.availability_zone_count}"
  vpc_cidr_block = "${data.aws_vpc.vpc.cidr_block}"
  newbits = "${ceil(log(local.subnet_count * 2, 2))}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SET OF SUBNETS TO SUPPORT PUBLIC-PRIVATE MULTIAZ ARCHITECTURE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "private" {
  count = "${local.subnet_count}"

  vpc_id     = "${var.vpc_id}"
  map_public_ip_on_launch = false

  cidr_block = "${cidrsubnet(local.vpc_cidr_block, local.newbits, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.availability_zones.names, count.index)}"

  tags = {
    Name = "${var.prefix}-private-${count.index}"
  }
}

resource "aws_subnet" "public" {
  count = "${local.subnet_count}"

  vpc_id     = "${var.vpc_id}"
  map_public_ip_on_launch = true

  cidr_block = "${cidrsubnet(local.vpc_cidr_block, local.newbits, local.subnet_count + count.index)}"
  availability_zone = "${element(data.aws_availability_zones.availability_zones.names, count.index)}"

  tags = {
    Name = "${var.prefix}-public-${count.index}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NAT GATEWAY FOR EACH PUBLIC SUBNET
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_eip" "eip" {
  count = "${local.subnet_count}"

  tags = {
    Name = "${var.prefix}-${count.index}"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count = "${local.subnet_count}"

  allocation_id = "${element(aws_eip.eip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"

  tags = {
    Name = "${var.prefix}-${count.index}"
  }
}
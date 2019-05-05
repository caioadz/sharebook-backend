module "vpc_with_internet_gateway" {
  source = "./modules/vpc-with-internet-gateway"

  vpc_name   = "${var.prefix}"
  cidr_block = "${var.cidr_block}"

  internet_gateway_name = "${var.prefix}"
}

module "public_private_multiaz_subnets" {
  source = "./modules/public-private-multiaz-subnets"

  prefix = "${var.prefix}"
  vpc_id = "${module.vpc_with_internet_gateway.vpc_id}"

  availability_zone_count = "${var.availability_zone_count}"
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  prefix           = "${var.prefix}"
  vpc_id           = "${module.vpc_with_internet_gateway.vpc_id}"
  instance_subnets = "${module.public_private_multiaz_subnets.private_subnet_ids}"
  lb_subnets       = "${module.public_private_multiaz_subnets.public_subnet_ids}"

  image_id         = "${var.image_id}"
  instance_type    = "${var.instance_type}"
  desired_capacity = "${var.desired_capacity}"
}

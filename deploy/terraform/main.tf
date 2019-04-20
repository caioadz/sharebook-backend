terraform {
  required_version = ">= 0.11.13"
}

provider "aws" {}

module "ecr_repository" {
  source = "./modules/ecr-repository"

  repository_name = "${var.service_name}"
}

module "vpc_with_internet_gateway" {
  source = "./modules/vpc-with-internet-gateway"

  vpc_name = "${var.service_name}-prod"
  cidr_block = "10.0.0.0/16"

  internet_gateway_name = "${var.service_name}-prod"
}

module "public_private_multiaz_subnets" {
  source = "./modules/public-private-multiaz-subnets"
  
  prefix = "${var.service_name}-prod"
  vpc_id = "${module.vpc_with_internet_gateway.vpc_id}"
  
  cidr_block_public_subnet_1 = "10.0.10.0/24"
  cidr_block_public_subnet_2 = "10.0.11.0/24"
  cidr_block_private_subnet_1 = "10.0.0.0/24"
  cidr_block_private_subnet_2 = "10.0.1.0/24"
}
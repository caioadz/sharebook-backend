terraform {
  required_version = ">= 0.11.13"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

module "ecr_repository" {
  source = "./modules/ecr-repository"

  ecr_repository_name = "${var.service_name}"
}
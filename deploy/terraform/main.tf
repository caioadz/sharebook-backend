terraform {
  required_version = ">= 0.11.13"
}

provider "aws" {}

module "ecr_repository" {
  source = "./modules/ecr-repository"

  ecr_repository_name = "${var.service_name}"
}
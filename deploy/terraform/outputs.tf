output "ecr_repository_arn" {
  value = "${module.ecr_repository.arn}"
}

output "ecr_repository_name" {
  value = "${module.ecr_repository.name}"
}

output "ecr_repository_registry_id" {
  value = "${module.ecr_repository.registry_id}"
}

output "ecr_repository_repository_url" {
  value = "${module.ecr_repository.repository_url}"
}
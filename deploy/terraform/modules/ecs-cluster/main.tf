module "default_instance_role" {
  source = "./modules/default-instance-role"

  prefix = "${var.prefix}"
}
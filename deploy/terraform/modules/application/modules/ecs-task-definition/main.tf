locals {
  classes = {
    digit = "/\"(-[[:digit:]]|[[:digit:]]+)\"/",
    null  = "/\"(null)\"/"
  }

  environment = "${jsonencode(var.container_environment)}"

  mountPoints = "${jsonencode(var.container_mountPoints)}"

  portMappings = "${
    replace(
      jsonencode(var.container_portMappings),
      local.classes["digit"],
      "$1"
    )
  }"

  container_definitions = "${
    replace(
      data.template_file.container_definition.rendered, 
      local.classes["null"],
      "$1"
    )
  }"
}

data "template_file" "container_definition" {
  template = "${file("${path.module}/templates/container_definitions.json.tpl")}"

  vars {
    name              = "${var.container_name}"
    essential         = "${var.container_essential ? true : false}"
    cpu               = "${var.container_cpu}"
    memory            = "${var.container_memory == 0 ? "null" : var.container_memory}"
    memoryReservation = "${var.container_memoryReservation == 0 ? "null" : var.container_memoryReservation}"
    image             = "${var.container_image}"
    portMappings      = "${local.portMappings}"
    environment       = "${local.environment}"
    mountPoints       = "${local.mountPoints}"
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "${var.family}"
  container_definitions = "${local.container_definitions}"
}

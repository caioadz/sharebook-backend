locals {
  classes = {
    digit = "/\"(-[[:digit:]]|[[:digit:]]+)\"/"
  }

  portMappings = "${
    replace(
      jsonencode(var.container_portMappings),
      local.classes["digit"],
      "$1"
    )
  }"
}

data "template_file" "container_definition" {
  template = "${file("${path.module}/templates/container_definitions.json.tpl")}"

  vars {
    name              = "${var.container_name}"
    cpu               = "${var.container_cpu == 0 ? "null" : var.container_cpu}"
    memory            = "${var.container_memory == 0 ? "null" : var.container_memory}"
    memoryReservation = "${var.container_memoryReservation == 0 ? "null" : var.container_memoryReservation}"
    image             = "${var.container_image}"
    portMappings      = "${local.portMappings == "[]" ? "null" : local.portMappings}"
  }
}

resource "aws_ecs_task_definition" "task_definition" {
  family                = "${var.family}"
  container_definitions = "${data.template_file.container_definition.rendered}"
}

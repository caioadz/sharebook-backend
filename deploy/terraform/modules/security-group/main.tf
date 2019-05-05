resource "aws_security_group" "security_group" {
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "default_egress_rule" {
  type = "egress"

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.security_group.id}"
}

###################################
# INGRESS
###################################

resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
  count = "${length(var.ingress_with_cidr_blocks)}"

  type      = "ingress"
  from_port = "${lookup(var.ingress_with_cidr_blocks[count.index], "from_port")}"
  to_port   = "${lookup(var.ingress_with_cidr_blocks[count.index], "to_port")}"
  protocol  = "${lookup(var.ingress_with_cidr_blocks[count.index], "protocol")}"

  cidr_blocks = ["${lookup(var.ingress_with_cidr_blocks[count.index], "cidr_blocks")}"]

  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
  count = "${length(var.ingress_with_source_security_group_id)}"

  type      = "ingress"
  from_port = "${lookup(var.ingress_with_source_security_group_id[count.index], "from_port")}"
  to_port   = "${lookup(var.ingress_with_source_security_group_id[count.index], "to_port")}"
  protocol  = "${lookup(var.ingress_with_source_security_group_id[count.index], "protocol")}"

  source_security_group_id = "${lookup(var.ingress_with_source_security_group_id[count.index], "source_security_group_id")}"

  security_group_id = "${aws_security_group.security_group.id}"
}

###################################
# EGRESS
###################################

resource "aws_security_group_rule" "egress_with_cidr_blocks" {
  count = "${length(var.egress_with_cidr_blocks)}"

  type      = "egress"
  from_port = "${lookup(var.egress_with_cidr_blocks[count.index], "from_port")}"
  to_port   = "${lookup(var.egress_with_cidr_blocks[count.index], "to_port")}"
  protocol  = "${lookup(var.egress_with_cidr_blocks[count.index], "protocol")}"

  cidr_blocks = ["${lookup(var.egress_with_cidr_blocks[count.index], "cidr_blocks")}"]

  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "egress_with_source_security_group_id" {
  count = "${length(var.egress_with_source_security_group_id)}"

  type      = "egress"
  from_port = "${lookup(var.egress_with_source_security_group_id[count.index], "from_port")}"
  to_port   = "${lookup(var.egress_with_source_security_group_id[count.index], "to_port")}"
  protocol  = "${lookup(var.egress_with_source_security_group_id[count.index], "protocol")}"

  source_security_group_id = "${lookup(var.egress_with_source_security_group_id[count.index], "source_security_group_id")}"

  security_group_id = "${aws_security_group.security_group.id}"
}

###################################
# COMPUTED INGRESS
###################################

resource "aws_security_group_rule" "computed_ingress_with_cidr_blocks" {
  count = "${var.computed_ingress_with_cidr_blocks_count}"

  type      = "ingress"
  from_port = "${lookup(var.computed_ingress_with_cidr_blocks[count.index], "from_port")}"
  to_port   = "${lookup(var.computed_ingress_with_cidr_blocks[count.index], "to_port")}"
  protocol  = "${lookup(var.computed_ingress_with_cidr_blocks[count.index], "protocol")}"

  cidr_blocks = ["${lookup(var.computed_ingress_with_cidr_blocks[count.index], "cidr_blocks")}"]

  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "computed_ingress_with_source_security_group_id" {
  count = "${var.computed_ingress_with_source_security_group_id_count}"

  type      = "ingress"
  from_port = "${lookup(var.computed_ingress_with_source_security_group_id[count.index], "from_port")}"
  to_port   = "${lookup(var.computed_ingress_with_source_security_group_id[count.index], "to_port")}"
  protocol  = "${lookup(var.computed_ingress_with_source_security_group_id[count.index], "protocol")}"

  source_security_group_id = "${lookup(var.computed_ingress_with_source_security_group_id[count.index], "source_security_group_id")}"

  security_group_id = "${aws_security_group.security_group.id}"
}

###################################
# COMPUTED EGRESS
###################################

resource "aws_security_group_rule" "computed_egress_with_cidr_blocks" {
  count = "${var.computed_egress_with_cidr_blocks_count}"

  type      = "egress"
  from_port = "${lookup(var.computed_egress_with_cidr_blocks[count.index], "from_port")}"
  to_port   = "${lookup(var.computed_egress_with_cidr_blocks[count.index], "to_port")}"
  protocol  = "${lookup(var.computed_egress_with_cidr_blocks[count.index], "protocol")}"

  cidr_blocks = ["${lookup(var.computed_egress_with_cidr_blocks[count.index], "cidr_blocks")}"]

  security_group_id = "${aws_security_group.security_group.id}"
}

resource "aws_security_group_rule" "computed_egress_with_source_security_group_id" {
  count = "${var.computed_egress_with_source_security_group_id_count}"

  type      = "egress"
  from_port = "${lookup(var.computed_egress_with_source_security_group_id[count.index], "from_port")}"
  to_port   = "${lookup(var.computed_egress_with_source_security_group_id[count.index], "to_port")}"
  protocol  = "${lookup(var.computed_egress_with_source_security_group_id[count.index], "protocol")}"

  source_security_group_id = "${lookup(var.computed_egress_with_source_security_group_id[count.index], "source_security_group_id")}"

  security_group_id = "${aws_security_group.security_group.id}"
}

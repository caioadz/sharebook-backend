resource "aws_eip" "eip" {
  tags = {
    Name = "${var.name}"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.eip.id}"

  subnet_id     = "${var.subnet_id}"

  tags = {
    Name = "${var.name}"
  }
}
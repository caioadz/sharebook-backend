resource "aws_eip" "eip" {
  count = "${var.subnet_count}"

  tags {
    Name = "${var.name}-${count.index}"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count = "${var.subnet_count}"

  allocation_id = "${element(aws_eip.eip.*.id, count.index)}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"

  tags {
    Name = "${var.name}-${count.index}"
  }
}

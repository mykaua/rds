data "aws_vpc" "rds" {
  count = "${length(var.rds)}"
  filter {
    name   = "tag:Name"
    values = ["${var.rds[count.index].vpc_tag_name}"]
  }
}


resource "aws_security_group" "sec_grp_rds" {
  count = "${length(var.rds)}"
  name        = "${var.rds[count.index].rds_name}"
  vpc_id      = "${data.aws_vpc.rds[count.index].id}"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.rds[count.index].cidr_block}"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.rds[count.index].rds_name}"
  }
}

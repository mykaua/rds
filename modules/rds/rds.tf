data "aws_subnet_ids" "rds" {
  count = "${length(var.rds)}"
  vpc_id = "${data.aws_vpc.rds[count.index].id}"
  filter{
    name   = "tag:type"
    values = ["${var.rds[count.index].subnet-tag-service}"]
  }
}

resource "aws_db_subnet_group" "db_sub_gr" {
  count = "${length(var.rds)}"
  name        = "${var.rds[count.index].rds_name}"
  subnet_ids  = "${data.aws_subnet_ids.rds[count.index].ids}"

}


resource "aws_db_instance" "default" {
  count = "${length(var.rds)}"
  identifier           = "${var.rds[count.index].rds_name}"
  allocated_storage    = "${var.rds[count.index].allocated_storage}"
  storage_type         = "${var.rds[count.index].storage_type}"
  engine               = "${var.rds[count.index].engine}"
  engine_version       = "${var.rds[count.index].engine_version}"
  instance_class       = "${var.rds[count.index].instance_class}"
  name                 = "${var.rds[count.index].rds_name}"
  username             = "${var.rds[count.index].username}"
  password             = "${var.rds[count.index].password}"

  vpc_security_group_ids = ["${aws_security_group.sec_grp_rds[count.index].id}"]

  db_subnet_group_name = "${element(aws_db_subnet_group.db_sub_gr.*.id, count.index)}"
  storage_encrypted    = "${var.rds[count.index].storage_encrypted}"
  skip_final_snapshot  = true
  publicly_accessible  = false
  multi_az             = "${var.rds[count.index].multi_az}"

  tags = {
    Name = "${var.rds[count.index].rds_name}"
  }
}

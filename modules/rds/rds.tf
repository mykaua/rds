data "aws_subnet_ids" "rds" {
  vpc_id = "${data.aws_vpc.rds.id}"
  filter{
    name   = "tag:type"
    values = ["rds"]
  }
}

resource "aws_db_subnet_group" "db_sub_gr" {
  name        = "rds"
  subnet_ids  = "${data.aws_subnet_ids.rds.ids}"

}


resource "aws_db_instance" "default" {
  allocated_storage    = "${var.allocated_storage}"
  storage_type         = "${var.storage_type}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.rds_name}"
  username             = "${var.username}"
  password             = "${var.password}"

  vpc_security_group_ids = ["${aws_security_group.sec_grp_rds.id}"]

  db_subnet_group_name = "${aws_db_subnet_group.db_sub_gr.id}"
  storage_encrypted    = false
  skip_final_snapshot  = true
  publicly_accessible  = false
  multi_az             = true
}

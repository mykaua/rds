
data "aws_vpc" "rds" {

  filter {
    name   = "tag:Name"
    values = ["RDS"]
  }
}


resource "aws_security_group" "sec_grp_rds" {
  name        = "${var.rds_name}"
  vpc_id      = "${data.aws_vpc.rds.id}"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.rds_name}"
  }
}

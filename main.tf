# EKS Terraform module

module "rds" {
  source   = "./modules/rds"
  rds_name = "${var.rds_name}"
  allocated_storage = "${var.allocated_storage}"
  storage_type = "${var.storage_type}"
  engine = "${var.engine}"
  engine_version = "${var.engine_version}"
  instance_class = "${var.instance_class}"
  username = "${var.username}"
  password = "${var.password}"
}

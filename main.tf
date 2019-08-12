# RDS Terraform module

module "rds" {
  source = "./modules/rds"
  rds = "${var.rds}"
}

variable "aws-region" {
  type        = "string"
  description = "The AWS Region to deploy EKS"
}

variable "aws-profile" {
  type    = "string"
}

variable "rds_name" {
  default = "hello_world"
}

variable "allocated_storage" {
  default = 20
}

variable "storage_type" {
  default = "gp2"
}

variable "engine" {
  default = "postgres"
}


variable "engine_version" {
  default = "10.6"
}

variable "instance_class" {
  default = "db.t2.micro"
}

variable "username" {
  default = "hello"
}

variable "password" {
  default = "epam_hello"
}

variable "aws-region" {
  type        = "string"
  description = "The AWS Region to deploy EKS"
}

variable "aws-profile" {
  type    = "string"
}

variable "rds" {
  type = list(object({
    rds_name = string
    vpc_tag_name = string
    subnet-tag-service = string
    allocated_storage = number
    storage_type = string
    engine = string
    engine_version = string
    instance_class = string
    username = string
    password = string
    storage_encrypted = bool
    multi_az = bool
    }))
  default = []
}

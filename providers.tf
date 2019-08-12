#
# Provider Configuration

provider "aws" {
  region = "${var.aws-region}"
  profile = "${var.aws-profile}"
}


provider "kubernetes" {
  username = "terraform"
  version = "= 1.6.2"
}

provider "random" {
  version = "~> 2.1"
}

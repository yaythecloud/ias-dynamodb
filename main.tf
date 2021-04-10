provider "aws" {
    region            = var.region
}

locals {
    release_version   = "0.1"
    terraform_version = "0.13"
    hashicorp_aws     = "3.35.0"
}

module "dynamodb" {
    source            = "./module"

    tags = {
        Terraform     = "true"
        IAS           = "true"
    }
}
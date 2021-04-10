variable "region" {
    description = "The AWS region. Default is us-east-1"
    default = "us-east-1"
}

variable "environment" {
    description = "Deployment environment. Example: dev, qa, stg, prod."
    type        = string
    default     = "dev"
}
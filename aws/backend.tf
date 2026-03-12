variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket               = "s3-groot-tfstate"
    key                  = "global/groot/terraform.tfstate"
    region               = "ap-south-1"
    dynamodb_table       = "terraform-lock"
    encrypt              = true
    workspace_key_prefix = "env"
  }
}
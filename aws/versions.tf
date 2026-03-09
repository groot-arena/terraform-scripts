terraform {
    required_version = ">= 1.5.3"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>6.0"
        }
    }
    backend "s3" {
        bucket  = "s3-groot-tfstate"
        key     = "global/groot/develop/terraform.tfstate"
        region  = "ap-south-1"
        encrypt = true
    }
}
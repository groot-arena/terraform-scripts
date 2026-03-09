# Configure the AWS Provider (modern approach)
provider "aws" {
  # Region should be set via environment variable AWS_DEFAULT_REGION 
  # or AWS CLI configuration, not directly in provider block
  region = var.aws_region

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}
## AWS Region
aws_region = "ap-south-1"

# Resource Tagging Strategy
# Standard tags applied to all resources for management and cost tracking
common_tags = {
  Application = "groot-project"
  Environment = "develop"
  ManagedBy   = "Terraform"
  Creator     = "hello@groot.in"
  Owner       = "hello@groot.in"
}

# Environment and Project
environment  = "dta"
project_name = "dmp"

s3_buckets = {
  "groot-alb-logs" = {
    bucket_name         = "s3-groot-alb-logs"
    bucket_prefix       = null
    force_destroy       = false
    object_lock_enabled = false
    enable_versioning   = true

    tags = {
      Name        = "s3-groot-alb-logs"
      Description = "Groot alb access and connection logs bucket"
      Owner       = "reachme@groot.in"
    }
  }
}
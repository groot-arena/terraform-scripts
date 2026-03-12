variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = ""
}

# Common Tags
variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}

# S3 Buckets Configuration - Map of bucket configurations
variable "s3_buckets" {
  description = "Map of S3 bucket configurations."
  type = map(object({
    # Basic bucket configuration
    bucket_name         = optional(string)
    bucket_prefix       = optional(string)
    force_destroy       = optional(bool, false)
    object_lock_enabled = optional(bool, false)
    enable_versioning   = optional(bool, true)

    # Tags specific to this bucket
    tags = optional(map(string), {})
  }))
}

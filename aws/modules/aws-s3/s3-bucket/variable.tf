# Basic S3 Bucket Configuration Variables

variable "bucket_name" {
  description = "Name of the S3 bucket. Must be lowercase and globally unique."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Prefix for bucket name (conflicts with 'bucket_name')."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Whether to delete all objects (including locked ones) on bucket destroy."
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Indicates whether Object Lock is enabled on the bucket."
  type        = bool
  default     = false
}

variable "tags" {
    description = "The tags to be assigned to the S3 Bucket"
    type        = map(string)
}
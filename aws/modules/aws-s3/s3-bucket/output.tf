# Basic S3 Bucket Outputs

output "bucket_id" {
    description = "The name of the bucket"
    value = aws_s3_bucket.this.id
}

output "bucket_arn" {
    description = "The ARN of the bucket."
    value = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
    description = "The domain name of the bucket."
    value = aws_s3_bucket.this.bucket_domain_name
}

output "bucket_regional_domain_name" {
    description = "The regional domain name of the bucket."
    value = aws_s3_bucket.this.bucket_regional_domain_name
}

output "bucket_region" {
    description = "The AWS region where the bucket is located."
    value = aws_s3_bucket.this.region
}

output "hosted_zone_id" {
    description = "The Route 53 Hosted Zone ID for the bucket's region."
    value = aws_s3_bucket.this.hosted_zone_id
}

output "tags" {
    description = "The tags assigned to the bucket."
    value = aws_s3_bucket.this.tags
}

output "bucket_prefix" {
    description = "The prefix used for the bucket name (if any)."
    value = aws_s3_bucket.this.bucket_prefix
}

output "force_destroy" {
    description = "Whether the bucket will be forcefully destroyed when the resource is deleted."
    value = aws_s3_bucket.this.force_destroy
}

output "object_lock_enabled" {
    description = "Whether object lock is enabled for the bucket."
    value = aws_s3_bucket.this.object_lock_enabled
}
# AWS S3 Bucket Terraform Module

This Terraform module creates a basic AWS S3 bucket with configurable options for naming, destruction behavior, object locking, and tagging. It is designed to be reusable across environments and provides essential outputs for integration with other resources.

## Features

- Creates an S3 bucket with a specified name or prefix.
- Supports force destruction of bucket contents.
- Enables object locking if required.
- Applies custom tags.
- Outputs bucket details for downstream use (e.g., in CloudFront or IAM policies).

---

### Requirements

|Name|Version|
|----|-------|
|terraform|>= 1.0|
|aws|>= 5.0|


### Providers

|Name|Version|
|----|-------|
|aws|>= 5.0|


### Usage

### Basic Example
To use this module, add the following to your Terraform configuration:
```hcl
module "s3_bucket" {
  source = "./path/to/module"  # Or use a Git/Registry source

  bucket_name = "my-unique-bucket-name"  # Required: Globally unique lowercase name
  # bucket_prefix = "my-prefix-"  # Alternative: Use prefix instead of full name

  force_destroy = true
  object_lock_enabled = false
  tags = {
    Environment = "production"
    Owner = "team@example.com"
  }
}
```

### Advanced Example
For a bucket with object locking enabled:
```hcl
module "s3_bucket" {
  source = "./path/to/module"

  bucket_prefix = "secure-data-"
  force_destroy = false  # Safer for production
  object_lock_enabled = true
  tags = {
    Project = "DataLake"
    Compliance = "GDPR"
  }
}
```

Run the following commands to apply:
```bash
terraform init
terraform plan
terraform apply
```

## Inputs
The module accepts the following input variables:

|Name|Description|Type|Default|Required|
|----|-----------|----|-------|--------|
|bucket_name|Name of the S3 bucket. Must be lowercase and globally unique.|`string`|```null```|no|
|bucket_prefix|Prefix for bucket name (conflicts with `bucket_name`).|`string`|```null```|no|
|force_destroy|Whether to delete all objects (including locked ones) on bucket destroy.|`bool`|`false`|no|
|object_lock_enabled|Indicates whether Object Lock is enabled on the bucket.|`bool`|`false`|no|
|tags|The tags to be assigned to the S3 Bucket.|`map(string)`|`{}`|no|

### Notes:

Either `bucket_name` or `bucket_prefix` must be provided; using both will cause a conflict.
`bucket_name` takes precedence if both are specified.

## Outputs
The module exports the following outputs:
|Name|Description|Value|
|----|-----------|-----|
|bucket_id|The name of the bucket.|`${aws_s3_bucket.this.id}`|
|bucket_arn|The ARN of the bucket.|`${aws_s3_bucket.this.arn}`|
|bucket_domain_name|The domain name of the bucket.|`${aws_s3_bucket.this.bucket_domain_name}`|
|bucket_regional_domain_name|The regional domain name of the bucket.|`${aws_s3_bucket.this.bucket_regional_domain_name}`|
|bucket_region|The AWS region where the bucket is located.|`${aws_s3_bucket.this.region}`|
|hosted_zone_id|The Route 53 Hosted Zone ID for the bucket's region.|`${aws_s3_bucket.this.hosted_zone_id}`|
|tags|The tags assigned to the bucket.|`${aws_s3_bucket.this.tags}`|
|bucket_prefix|The prefix used for the bucket name (if any).|`${aws_s3_bucket.this.bucket_prefix}`|
|force_destroy|Whether the bucket will be forcefully destroyed when the resource is deleted.|`${aws_s3_bucket.this.force_destroy}`|
|object_lock_enabled|Whether object lock is enabled for the bucket.|`${aws_s3_bucket.this.object_lock_enabled}`|

### Example Output Usage
```hcl
# Reference outputs in another module
resource "aws_s3_bucket_policy" "example" {
  bucket = module.s3_bucket.bucket_id
  policy = jsonencode({
    # Policy document here
  })
}
```

## Resources Created

- `aws_s3_bucket.this`: The core S3 bucket resource.

## Limitations

- This module creates a basic S3 bucket without advanced features like versioning, encryption, or public access blocks. Extend it or compose with other modules for those.
- Object Lock requires additional configuration (e.g., retention policies) not included here; enable only if needed and configure separately.
- Bucket naming follows AWS rules: 3-63 characters, lowercase letters, numbers, hyphens, periods.

## Contributing
Feel free to fork and submit pull requests for improvements, such as adding more S3 configurations or examples.
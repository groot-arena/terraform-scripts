# S3 Buckets Module - Using for_each to create multiple buckets
module "s3_buckets" {
    source = "./modules/aws-s3/s3-bucket"
    for_each = var.s3_buckets

    bucket_name         = each.value.bucket_name
    bucket_prefix       = each.value.bucket_prefix
    force_destroy       = each.value.force_destroy
    object_lock_enabled = each.value.object_lock_enabled
    tags                = merge(var.common_tags, each.value.tags)
}
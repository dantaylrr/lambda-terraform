/*data "aws_s3_bucket_object" "source_code_hash" {
    for_each    = var.config

    s3_bucket   = local.s3_deployment_package_bucket_name[each.key]
    hash_key    = local.s3_deployment_package_hash_key[each.key]
}*/
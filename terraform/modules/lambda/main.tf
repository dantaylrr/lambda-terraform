module "lambda" {
  source    = "terraform-aws-modules/lambda/aws"
  version   = "4.12.1"
  for_each  = var.config

  function_name             = local.lambda_function_name[each.key]
  description               = local.lambda_description[each.key]
  handler                   = local.handler[each.key]
  runtime                   = local.runtime[each.key]
  architectures             = local.architectures[each.key]
  environment_variables     = local.env_variables[each.key]
  timeout                   = local.timeout[each.key]

  /*# Check source code
  source_code_hash          = chomp(data.aws_s3_bucket_object.source_code_hash.body)*/
  ignore_source_code_hash   = true

  # Lambda role
  create_role               = false
  lambda_role               = local.lambda_role_arn[each.key]

  # S3 deployment package location
  create_package            = false
  s3_existing_package       = {
    bucket = local.s3_deployment_package_bucket_name[each.key]
    key    = local.s3_deployment_package_key[each.key]
  }
}
locals {
    lambda_function_name = {
        for k, v in var.config :
        k => lookup(v, "lambda_function_name", "")
    }

    lambda_description = {
        for k, v in var.config :
        k => lookup(v, "lambda_description", "")
    }

    handler = {
        for k, v in var.config :
        k => lookup(v, "handler", "")
    }

    runtime = {
        for k, v in var.config :
        k => lookup(v, "runtime", "")
    }

    architectures = {
        for k, v in var.config :
        k => lookup(v, "architectures", "")
    }

    env_variables = {
        for k, v in var.config :
        k => lookup(v, "env_variables", {})
    }

    timeout = {
        for k, v in var.config :
        k => lookup(v, "timeout", 30)
    }

    lambda_role_arn = {
        for k, v in var.config :
        k => lookup(v, "lambda_role_arn", "")
    }

    s3_deployment_package_bucket_name = {
        for k, v in var.config :
        k => lookup(v, "s3_deployment_package_bucket_name", "")
    }

    s3_deployment_package_key = {
        for k, v in var.config :
        k => lookup(v, "s3_deployment_package_key", "")
    }
}
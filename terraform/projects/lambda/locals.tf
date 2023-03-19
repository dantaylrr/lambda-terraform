locals {
    lambda_configuration    = lookup(var.config, "lambda", {})
}
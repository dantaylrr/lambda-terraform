module "lambda" {
    source      = "../../modules/lambda"

    config      = local.lambda_configuration
}
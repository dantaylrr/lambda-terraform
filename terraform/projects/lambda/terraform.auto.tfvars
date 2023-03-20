config = {
    lambda = {
        get-time = {
            lambda_function_name        = "get-time"
            lambda_description          = "Lambda to get the current time."
            handler                     = "src.main.app.lambda_handler"
            runtime                     = "python3.7"
            architectures               = ["x86_64"]
            env_variables               = {}
            timeout                     = 30

            lambda_role_arn             = "<add_iam_arn_here>"
            
            s3_deployment_package_bucket_name = "<add_s3_bucket_name_here>"
            s3_deployment_package_key = "<add_s3_deployment_key_here>"
        }

        get-date = {
            lambda_function_name        = "get-date"
            lambda_description          = "Lambda to get the current date."
            handler                     = "src.main.app.lambda_handler"
            runtime                     = "python3.7"
            architectures               = ["x86_64"]
            env_variables               = {}
            timeout                     = 30

            lambda_role_arn             = "<add_iam_arn_here>"
            
            s3_deployment_package_bucket_name = "<add_s3_bucket_name_here>"
            s3_deployment_package_key = "<add_s3_deployment_key_here>"
        }
    }
}
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

            lambda_role_arn             = "arn:aws:iam::773189086839:role/service-role/getTime-role-fbuvjhcv"
            
            s3_deployment_package_bucket_name = "dan-tf-lambda-templates"
            s3_deployment_package_key = "get-time/deployment-package/deployment-package.zip"
            s3_deployment_package_hash_key = "get-time/source-hash/deployment-package.sha256"
        }
    }
}
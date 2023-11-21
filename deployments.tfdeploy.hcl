identity_token "aws" {
  audience = ["<Set to your AWS IAM assume-role audience>"]
}

deployment "development" {
  variables = {
    region              = "us-east-1"
    role_arn            = "<Set to your development AWS account IAM role ARN>"
    identity_token_file = identity_token.aws.jwt_filename
  }
}

deployment "production" {
  variables = {
    region              = "us-east-1"
    role_arn            = "<Set to your production AWS account IAM role ARN>"
    identity_token_file = identity_token.aws.jwt_filename
  }
}


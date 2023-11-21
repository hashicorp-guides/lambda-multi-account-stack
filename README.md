# lambda-multi-account-stack

_This is an example stack configuration for the private preview of Terraform Stacks. Language
constructs and features are subject to change given feedback received during this preview. Do not
use Stacks for production workloads at this time._

![lambda-multi-account-stack](https://github.com/hashicorp/lambda-multi-account-stack/assets/2430490/a6d2bb5c-5a0e-49fa-ba3d-a9b0dc47ec0f)

An example Terraform Stack that provisions an AWS S3 bucket, an AWS Lambda function served from that bucket,
and an AWS API Gateway to invoke that function at a URL, all across multiple AWS accounts.

This is the same system as in [hashicorp/lambda-api-gateway-stack](https://github.com/hashicorp/lambda-api-gateway-stack), but
additionally demonstrates multiple deployments modeling environments, each one managed by its own
AWS account.

_We do not recommend using this example within production accounts. This example will incur [small]
costs if provisioned. Please remember to destroy the infrastructure after using this example._

## Usage

_Prerequisites: You must have a Terraform Cloud account with access to the private preview of
Terraform Stacks, a GitHub account, and an AWS account with Terraform Cloud configured as an OIDC
identity provider. Details of all of this are found in the provided Stacks User Guide._

1. **Configure AWS authentication** by creating new IAM roles in the AWS web console (or with
   Terraform itself!) with proper permissions (S3, Lambda, and API Gateway) and a trust policies to
   allow the role to be assumed by Terraform Cloud (the OIDC identity provider). More details on this
   step can be found in the Stacks User Guide.
2. **Fork this repository** to your own GitHub account, such that you can edit this stack configuration
   for your purposes.
3. **Edit your forked stack configuration** and change `deployments.tfdeploy.hcl` to use the ARN of the
   IAM role you created, as well as an audience value for OpenID Connect.
4. **Create a new stack** in Terraform Cloud and connect it to your forked configuration repository.
5. **Provision away!**

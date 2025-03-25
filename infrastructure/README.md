# Infrastructure as Code with Terraform

This directory contains Terraform configuration files to manage AWS resources for the project.

## Files Organization

- `main.tf` - Main Terraform configuration (VPC, networking, etc.)
- `variables.tf` - Main project variables
- `outputs.tf` - Main project outputs
- `frontend.tf` - S3 and CloudFront configuration for React frontend
- `frontend_variables.tf` - Configuration specific to frontend deployment
- `frontend_outputs.tf` - Frontend outputs (bucket names, URLs, etc.)
- `terraform_state.tf` - Configuration for Terraform remote state (S3 backend)

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version >= 1.0.0)
- AWS credentials configured

### Initialize Terraform

```bash
terraform init
```

### Plan Changes

```bash
terraform plan
```

### Apply Changes

```bash
terraform apply
```

### Destroy Resources

```bash
terraform destroy
```

## Frontend Deployment

The `frontend.tf` file sets up:
- S3 bucket for hosting the React application
- CloudFront distribution for content delivery
- Proper permissions and configurations

### Deploying the Frontend

After applying the Terraform configuration, deploy the frontend using the provided script:

```bash
cd ../packages/frontend && npm run deploy
```

This will:
- Build the React application
- Upload the build files to S3
- Invalidate the CloudFront cache

## Frontend Configuration

You can customize the frontend deployment by modifying the variables in `frontend_variables.tf`:

- `frontend_allowed_origins` - List of allowed origins for CORS
- `frontend_cache_ttl` - Default TTL for cached objects (in seconds)
- `frontend_price_class` - CloudFront price class

## Deploying Frontend Only

If you want to deploy only the frontend infrastructure (S3 and CloudFront) without the VPC and other resources:

1. Create a separate directory for frontend-only deployment:
```bash
mkdir frontend_infra
cp frontend.tf frontend_variables.tf frontend_outputs.tf frontend_infra/
cd frontend_infra
```

2. Initialize and apply Terraform:
```bash
terraform init
terraform apply
```

3. Deploy the frontend application:
```bash
cd ../../packages/frontend
TF_STATE_PATH=../../infrastructure/frontend_infra/terraform.tfstate ./deploy.sh
```

Alternatively, you can use the -target option to deploy only specific resources:
```bash
terraform apply -target=aws_s3_bucket.frontend -target=aws_cloudfront_distribution.frontend
```

## Outputs

After deployment, you can view important information with:
```bash
terraform output
```

Key outputs include:
- `cloudfront_domain_name` - The URL to access your application
- `frontend_bucket_name` - The S3 bucket name
- `cloudfront_distribution_id` - The CloudFront distribution ID
# Frontend infrastructure outputs

output "frontend_bucket_name" {
  description = "Name of the S3 bucket hosting the frontend"
  value       = aws_s3_bucket.frontend.bucket
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.frontend.id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "frontend_deployment_commands" {
  description = "Commands to deploy the frontend"
  value       = <<EOT
# Build the frontend
cd packages/frontend && npm run build

# Sync the build to S3
aws s3 sync packages/frontend/dist s3://${aws_s3_bucket.frontend.bucket} --delete

# Invalidate CloudFront cache
aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.frontend.id} --paths "/*"
EOT
}
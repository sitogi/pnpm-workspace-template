#!/bin/bash
# Script to deploy the React frontend to S3 and invalidate CloudFront cache

set -e

# 環境変数からTerraform状態ファイルのパスを取得（指定がなければデフォルトを使用）
TF_STATE_PATH=${TF_STATE_PATH:-"../../infrastructure/terraform.tfstate"}
INFRA_DIR=$(dirname "$TF_STATE_PATH")
TF_STATE_FILE=$(basename "$TF_STATE_PATH")

# Terraformの出力を取得するディレクトリに移動
cd "$INFRA_DIR"

# Terraform状態ファイルが存在するか確認
if [ ! -f "$TF_STATE_FILE" ]; then
  echo "エラー: Terraform状態ファイル ($TF_STATE_FILE) が見つかりません。"
  echo "先にTerraformでインフラをデプロイしてください: terraform apply"
  exit 1
fi

# S3バケット名とCloudFront IDを取得
BUCKET_NAME=$(terraform output -state="$TF_STATE_FILE" -raw frontend_bucket_name)
DISTRIBUTION_ID=$(terraform output -state="$TF_STATE_FILE" -raw cloudfront_distribution_id)

# フロントエンドディレクトリに戻る
cd - > /dev/null

echo "Building frontend..."
npm run build

echo "Deploying to S3 bucket: $BUCKET_NAME"
aws s3 sync dist s3://$BUCKET_NAME --delete

echo "Invalidating CloudFront cache for distribution: $DISTRIBUTION_ID"
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"

echo "Deployment complete! The website will be available at:"
cd "$INFRA_DIR" && terraform output -state="$TF_STATE_FILE" -raw cloudfront_domain_name
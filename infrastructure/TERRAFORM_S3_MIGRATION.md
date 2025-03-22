# Terraform S3バックエンド移行手順

## S3バックエンドへの移行

terraformの状態管理をS3に移行する際は、以下の手順に従ってください。

### 1. バックエンド用のリソースを作成する

まず、S3バケットとDynamoDBテーブルを作成します。

```bash
# backend.tfのみ適用して必要なリソースを作成
cd infrastructure
terraform apply -target=aws_s3_bucket.terraform_state -target=aws_s3_bucket_versioning.terraform_state -target=aws_s3_bucket_server_side_encryption_configuration.terraform_state -target=aws_s3_bucket_public_access_block.terraform_state -target=aws_dynamodb_table.terraform_lock
```

### 2. 状態をS3に移行する

```bash
# main.tfのterraform backendブロックがアンコメントされていることを確認
# 状態の初期化とリモート移行
terraform init -migrate-state
```

確認プロンプトで「yes」と入力すると、ローカルの状態ファイルがS3バケットに移行されます。

### 3. 移行の確認

```bash
# 状態が正しく移行されたことを確認
terraform state list
```

## 利点

- **チーム共有**: 複数人で同時に作業する場合でも、状態ファイルが一箇所で管理されます
- **バージョン管理**: S3のバージョニング機能により、状態ファイルの履歴が保持されます
- **ロック機能**: DynamoDBによる状態ロックで、同時変更による競合を防止します
- **暗号化**: サーバーサイド暗号化で安全に保管されます

## 注意点

- バックエンド設定のリージョンやバケット名は変更するとエラーになるため、慎重に設定してください

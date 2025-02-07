# pnpm-workspace-template

## ローカル起動手順
 
1. pnpm をグローバルにインストールしておく
    - https://pnpm.io/installation#on-posix-systems
1. モジュールのインストール
    - `pnpm install`
1. 起動 
    - `pnpm start`
1. 終了
    - `pnpm stop`

## テスト実行

- ルートから全パッケージのテストを流す
    - `pnpm test`
- ルートから各パッケージのテストを流す
    - `pnpm backend test`
- 各パッケージに移動してからテストを流す
    - `cd packages/backend`
    - `pnpm test`

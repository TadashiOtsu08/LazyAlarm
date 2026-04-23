# 役割分担

## Tadashiの役割
- 要件・仕様の決定と /docs への仕様書追加
- Figmaでの画面デザイン
- Claude Codeへの作業指示
- シミュレーターでの動作確認・レビュー
- セキュリティ関連コードの手動レビュー・承認
- git add・git commit・git pushの手動実行
- push前のgit diffによる差分確認

## Claude Codeの役割
- /docs/specs の仕様書を読んでViewを実装する
- CLAUDE.mdおよび関連ドキュメントのルールに従う
- SwiftDataのモデル設計と永続化ロジックを実装する
- アニメーションをSwiftUIで実装する
- 作業完了後に変更ファイル一覧を報告する
- テストは手順の提示のみ行い・実行はしない

## Claude Codeが絶対にやってはいけないこと
- .envファイル・APIキー・秘密情報を読み込む
- git add・git commit・git pushを自動実行する
- セキュリティ関連のコードを無断で変更する
- 仕様書のない機能を独断で追加する
- 外部ライブラリを無断で追加する
- GoogleService-Info.plistを読み込む・変更する
- release/appstoreブランチへのpushを自動実行する
- build-config.mdを読み込む・内容を出力する
- SwiftShieldを無断で実行する
- 難読化済みコードをmainブランチに適用する

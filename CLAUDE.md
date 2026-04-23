# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

LazyAlarm is an iOS app built with SwiftUI. It targets iOS 26.1 and uses Swift 5.0 with modern concurrency features (approachable concurrency, main actor isolation).

## Commands

All development is done via Xcode or `xcodebuild`. There is no package manager (no CocoaPods, no SPM dependencies).

**Build:**
```bash
xcodebuild -project LazyAlarm.xcodeproj -scheme LazyAlarm -configuration Debug
```

**Run unit tests:**
```bash
xcodebuild test -project LazyAlarm.xcodeproj -scheme LazyAlarm -destination 'platform=iOS Simulator,name=iPhone 16'
```

## Architecture

- LazyAlarmApp.swift — @main entry point
- LazyAlarm/ — all app source files and Assets.xcassets
- LazyAlarmTests/ — unit tests（Swift Testing framework）
- LazyAlarmUITests/ — UI tests（XCTest）

## Key Configuration

- Bundle ID: Tadashi.LazyAlarm
- Deployment target: iOS 26.1
- Code signing: automatic (Team ID: NH32JNUKMU)

## アプリ概要
設定時刻から実際に起きるまでの「ズレ」とスヌーズ回数を記録し、
怠けるほどゆるいキャラクターが育っていく目覚ましアプリ。

## ディレクトリ構成
/LazyAlarm/Features/Alarm/               # アラーム設定・スヌーズ・停止
/LazyAlarm/Features/Alarm/Constants/     # アラーム画面のレイアウト定数
/LazyAlarm/Features/Alert/               # スワイプパズル解除画面
/LazyAlarm/Features/Alert/Constants/     # アラート画面のレイアウト定数
/LazyAlarm/Features/Character/           # キャラクター育成・アニメーション
/LazyAlarm/Features/Character/Constants/ # キャラクター画面のレイアウト定数
/LazyAlarm/Features/History/             # 履歴・統計グラフ
/LazyAlarm/Features/History/Constants/   # 履歴画面のレイアウト定数
/LazyAlarm/Shared/Theme/                 # Color+Theme・SFSymbols
/LazyAlarm/Shared/Components/            # 再利用可能なViewパーツ
/LazyAlarm/Shared/Models/                # SwiftDataのModelクラス
/docs/specs/                             # 各機能の仕様書（実装前に必ず読む）

## コーディング規約
- ViewはSmallに分割（1ファイル100行以内を目安）
- すべてのViewに #Preview を書く
- ViewModelは @Observable マクロを使う
- データ永続化はSwiftDataを使う（@Model, @Query）
- アニメーションはwithAnimation・.animation修飾子を使う
- エラーメッセージは日本語

### コメントについて
- 処理の意図がわかりにくい箇所には必ずコメントをつける
- コメントは日本語で書く
- 関数・プロパティには何をするものか1行コメントを書く
- 初心者が読んでも理解できる説明を心がける

### コードスタイル
- 複雑な書き方より、読みやすいシンプルな書き方を優先する
- 短く書く場合は意味がわかりにくくなる可能性を考え必ずコメントをつける
- クロージャのネストは最大2階層まで

### ファイル・フォルダ管理
- 新しい機能フォルダを作成するときは以下をセットで作成する：
  ・〇〇View.swift
  ・Constants/〇〇Layout.swift
- 1ファイル1責務を原則とする
- ファイル名はUpperCamelCase（例：AlarmSetupView.swift）

### 定数・マジックナンバー管理
- 数値・文字列を直接コードに書かない
- レイアウト定数は各機能のConstants/〇〇Layout.swiftに定義する
- 詳細ルール：/docs/coding-style.md を参照

### カラー管理
- カラーコードを直接コードに書かない
- Assets.xcassetsに登録しShared/Theme/Color+Theme.swiftから呼び出す
- 例）Color.backgroundPrimary

### アイコン名管理
- SF Symbolsのアイコン名を文字列で直接書かない
- Shared/Theme/SFSymbols.swiftから呼び出す
- 例）SFSymbols.alarm

### 共通コンポーネント
- 2画面以上で使うViewはShared/Componentsに切り出す
- 詳細ルール：/docs/coding-style.md を参照

## 命名規則
- View:       〇〇View        例）AlarmSetupView
- ViewModel:  〇〇ViewModel   例）AlarmSetupViewModel
- Model:      〇〇Record      例）AlarmRecord（SwiftData）
- Layout:     〇〇Layout      例）AlarmLayout
- Enum:       〇〇Type/State  例）CharacterState

## 新しいViewを実装するときのルール
1. /docs/specs の該当仕様書を最初に読む
2. このCLAUDE.mdのコーディング規約に従う
3. 再利用できるものはShared/Componentsに切り出す
4. 実装完了後に変更したファイル一覧を報告する

## 関連ドキュメント（実装前に必ず読むこと）
- セキュリティルール：/docs/security.md
- 役割分担：/docs/role.md
- コーディングスタイル詳細：/docs/coding-style.md
- 機能仕様：/docs/specs/ 配下の該当ファイル

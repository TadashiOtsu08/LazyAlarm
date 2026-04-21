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

**Run a single test:**
```bash
xcodebuild test -project LazyAlarm.xcodeproj -scheme LazyAlarm -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:LazyAlarmTests/LazyAlarmTests/testExample
```

**Run UI tests:**
```bash
xcodebuild test -project LazyAlarm.xcodeproj -scheme LazyAlarmUITests -destination 'platform=iOS Simulator,name=iPhone 16'
```

There is no linting configuration. Xcode's Swift compiler warnings serve as the primary static analysis.

## Architecture

The app uses a standard SwiftUI single-scene structure:

- **`LazyAlarmApp.swift`** — `@main` entry point; creates a `WindowGroup` with `ContentView` as the root
- **`LazyAlarm/`** — all app source files and `Assets.xcassets`
- **`LazyAlarmTests/`** — unit tests using the Swift `Testing` framework (not XCTest)
- **`LazyAlarmUITests/`** — UI tests using `XCTest`, including launch screenshot tests

Note the testing framework split: unit tests use the modern Swift `Testing` framework (`@Test`, `#expect`), while UI tests use `XCTest`.

## Key Configuration

- Bundle ID: `Tadashi.LazyAlarm`
- Deployment target: iOS 26.1
- Swift compiler flags: approachable concurrency, main actor isolation, member import visibility
- Code signing: automatic (Team ID: NH32JNUKMU)

## アプリ概要
設定時刻から実際に起きるまでの「ズレ」とスヌーズ回数を記録し、
怠けるほどゆるいキャラクターが育っていく目覚ましアプリ。

## ディレクトリ構成（これから作る）
/LazyAlarm/Features/Alarm        # アラーム設定・スヌーズ・停止ロジック
/LazyAlarm/Features/Character    # キャラクター状態・育成ロジック・アニメーション
/LazyAlarm/Features/History      # 履歴・週別・月別統計グラフ
/LazyAlarm/Shared/Components     # 再利用可能なViewパーツ
/LazyAlarm/Shared/Models         # SwiftDataのModelクラス
/docs/specs                      # 各機能の仕様書（実装前に必ず読む）

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
- 短く書く場合は、意味がわかりにくくなる可能性を考え必ずコメントをつける
- クロージャのネストは最大2階層まで

### ファイル・フォルダ管理
- フォルダ構成はこのCLAUDE.mdの「ディレクトリ構成」に従う
- 新しいファイルを追加する前に置き場所を確認する
- 1ファイル1責務を原則とする（1つのViewファイルに複数のViewを混在させない）
- ファイル名はUpperCamelCase（例：AlarmSetupView.swift）
- テストファイルは対象ファイル名＋Tests（例：AlarmSetupViewTests.swift）

## 命名規則
- View:       〇〇View        例）AlarmActiveView
- ViewModel:  〇〇ViewModel   例）CharacterViewModel
- Model:      〇〇Record      例）AlarmRecord（SwiftData）
- Enum:       〇〇Type/State  例）CharacterState

## 実装の優先順位
1. アラーム設定・スヌーズ（無制限）・完全停止
2. ズレ・スヌーズ回数の計測と記録（SwiftData）
3. キャラクターの育成ロジック＋アニメーション
4. 週別・月別統計グラフ（Swift Charts）

## 新しいViewを実装するときのルール
1. /docs/specs の該当仕様書を最初に読む
2. このCLAUDE.mdのコーディング規約に従う
3. 再利用できるものはShared/Componentsに切り出す
4. 実装完了後に変更したファイル一覧を報告する

## 関連ドキュメント（実装前に必ず読むこと）
- セキュリティルール：/docs/security.md
- 役割分担：/docs/role.md
- 機能仕様：/docs/specs/ 配下の該当ファイル

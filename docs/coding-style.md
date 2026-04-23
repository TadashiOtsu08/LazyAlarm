# コーディングスタイルガイド

## マジックナンバー・ハードコーディングの禁止

数値・文字列を直接コードに書かない。
必ず定数・enumとして定義して名前をつける。

### ❌ 禁止
```swift
.padding(.horizontal, 51)
.frame(height: 44)
Color(red: 1/255, green: 1/255, blue: 51/255)
Image(systemName: "alarm.fill")
```

### ✅ 推奨
```swift
.padding(.horizontal, AlarmLayout.horizontalMargin)
.frame(height: AlarmLayout.rowHeight)
Color.backgroundPrimary
Image(systemName: SFSymbols.alarm)
```

### レイアウト定数の定義場所
各機能フォルダ配下のConstants/に機能名をつけて定義する。

```swift
// Features/Alarm/Constants/AlarmLayout.swift
enum AlarmLayout {
    /// 水平方向のマージン
    static let horizontalMargin: CGFloat = 51
    /// アラーム行の高さ
    static let rowHeight: CGFloat = 44
    /// アラーム追加ボタンのサイズ
    static let addButtonSize: CGFloat = 48
}

// Features/Character/Constants/CharacterLayout.swift
enum CharacterLayout {
    // TODO: キャラクター画面実装時に追加
}
```

---

## カラー管理

### ルール
- カラーコードを直接コードに書かない
- 新しいカラーはColor+Theme.swiftとAssets.xcassetsにセットで追加する
- Claude Codeはコードのみ追加しAssetsへの登録は手動で行う

### 追加手順
1. Shared/Theme/Color+Theme.swiftに定義を追加する
   - 変数名：lazy〇〇の形式（例：lazyBackground）
   - Assets名："〇〇"の形式（例："BackgroundPrimary"）
2. Tadashiさんが手動でAssets.xcassetsにColor Setを追加する
   - Color Set名はコード内の文字列と完全一致させる

### 現在登録済みのカラー一覧
| 変数名 | Assets名 | カラーコード | 用途 |
|--------|---------|------------|------|
| lazyBackground | BackgroundPrimary | #010133 | メイン背景色 |
| lazyPink | AccentPink | #e8069d | アクセント・トグル |
| lazyTabSelected | TabSelected | #0088ff | タブ選択色 |

### コードでの呼び出し方
```swift
Color.lazyBackground
Color.lazyPink
Color.lazyTabSelected
```

### Assets.xcassetsへの手動登録手順
1. Assets.xcassetsを開く
2. 左下の「+」→「Color Set」を選択
3. 名前をコード内の文字列と完全一致で入力
4. 色ボックスをクリックしHexコードを入力

---

## SF Symbolsのアイコン名管理

### ルール
- SF Symbolsのアイコン名を文字列で直接書かない
- Shared/Theme/SFSymbols.swiftに定数として定義する

### ❌ 禁止
```swift
Image(systemName: "alarm.fill")
Image(systemName: "bell.fill")
```

### ✅ 推奨
```swift
Image(systemName: SFSymbols.alarm)
Image(systemName: SFSymbols.bell)
```

### SFSymbols.swiftの書き方
```swift
// Shared/Theme/SFSymbols.swift
enum SFSymbols {
    /// アラームアイコン（ホームタブ）
    static let alarm = "alarm.fill"
    /// ベルアイコン（アラートタブ）
    static let bell = "bell.fill"
    /// キャラクターアイコン（キャラクタータブ）
    static let character = "pawprint.fill"
    /// プラスアイコン（アラーム追加ボタン）
    static let plus = "plus"
}
```

---

## 共通コンポーネントの作成ルール

### ルール
- 2画面以上で使うViewはShared/Componentsに切り出す
- ファイル名はコンポーネント名と一致させる
- 必ず#Previewを書く

### 共通化すべき目安
- 同じButtonが2箇所以上に出てくる
- 同じレイアウトパターンが繰り返される
- アイコン＋テキストの組み合わせが複数ある

### 共通Buttonの例
```swift
// Shared/Components/CircleIconButton.swift
struct CircleIconButton: View {
    /// ボタンに表示するSF Symbolsのアイコン名
    let icon: String
    /// タップ時のアクション
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .foregroundStyle(.white)
                .frame(
                    width: AlarmLayout.addButtonSize,
                    height: AlarmLayout.addButtonSize
                )
                .background(.regularMaterial, in: Circle())
        }
    }
}

#Preview {
    CircleIconButton(icon: SFSymbols.plus, action: {})
}
```

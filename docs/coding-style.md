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
- すべてのカラーはAssets.xcassetsに登録する
- コードからはShared/Theme/Color+Theme.swiftのextensionで呼び出す
- カラーコードを直接コードに書かない

### Assets.xcassetsに登録するカラー一覧
- BackgroundPrimary：#010133（ダークネイビー）
- AccentPink：#e8069d（ピンク）
- TabSelected：#0088ff（タブ選択色）

### Color+Theme.swiftの書き方
```swift
// Shared/Theme/Color+Theme.swift
extension Color {
    /// メイン背景色（ダークネイビー #010133）
    static let backgroundPrimary = Color("BackgroundPrimary")
    /// アクセントカラー（ピンク #e8069d）
    static let accentPink = Color("AccentPink")
    /// タブ選択色（#0088ff）
    static let tabSelected = Color("TabSelected")
}
```

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

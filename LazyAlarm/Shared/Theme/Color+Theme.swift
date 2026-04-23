import SwiftUI

/// アプリ全体で使用するカラー定数
/// カラーコードを直接コードに書かずここから呼び出す
/// Assets.xcassetsに同名のColor Setを手動で登録すること
extension Color {
    /// メイン背景色（ダークネイビー #010133）
    /// Assets登録名：BackgroundPrimary
    static let lazyBackground = Color("BackgroundPrimary")
    /// アクセントカラー（ピンク #e8069d）
    /// Assets登録名：AccentPink
    static let lazyPink = Color("AccentPink")
    /// タブ選択色（#0088ff）
    /// Assets登録名：TabSelected
    static let lazyTabSelected = Color("TabSelected")
}

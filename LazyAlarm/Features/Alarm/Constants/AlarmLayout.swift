import CoreGraphics

/// アラーム画面のレイアウト定数
/// 数値を直接コードに書かずここから呼び出す
enum AlarmLayout {
    /// 水平方向のマージン
    static let horizontalMargin: CGFloat = 51
    /// アラーム行の縦パディング
    static let rowVerticalPadding: CGFloat = 12
    /// アラーム行の横パディング
    static let rowHorizontalPadding: CGFloat = 16
    /// アラーム追加ボタンのサイズ
    static let addButtonSize: CGFloat = 48
    /// ボタンの右パディング
    static let buttonTrailingPadding: CGFloat = 16
    /// ボタンの上パディング
    static let buttonTopPadding: CGFloat = 8
    /// セクションラベルの横パディング
    static let sectionLabelHorizontalPadding: CGFloat = 16
    /// セクションラベルの縦パディング
    static let sectionLabelVerticalPadding: CGFloat = 8
    /// リストの角丸
    static let listCornerRadius: CGFloat = 12
    /// リストの背景透明度
    static let listBackgroundOpacity: CGFloat = 0.05
    /// 区切り線の太さ
    static let dividerHeight: CGFloat = 0.5
    /// 区切り線の透明度
    static let dividerOpacity: CGFloat = 0.3
    /// 注意書きのフォントサイズ
    static let warningFontSize: CGFloat = 12
    /// 注意書きの透明度
    static let warningOpacity: CGFloat = 0.4
    /// 注意書きの下パディング
    static let warningBottomPadding: CGFloat = 16
}

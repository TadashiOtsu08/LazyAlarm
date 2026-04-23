import SwiftUI

/// アラーム一覧・設定のメイン画面（ホーム）
struct AlarmSetupView: View {

    /// アラーム一覧の状態を管理するViewModel
    @State private var viewModel = AlarmSetupViewModel()

    var body: some View {
        ZStack {
            Color.lazyBackground.ignoresSafeArea()

            VStack(spacing: 0) {
                addButtonRow
                Spacer() // キャラクター表示エリア（将来実装）
                alarmSection
            }
        }
    }

    /// 右上の新規アラーム追加ボタン（Liquid Glassスタイル）
    private var addButtonRow: some View {
        HStack {
            Spacer()
            Button(action: viewModel.addAlarm) {
                Image(systemName: SFSymbols.plus)
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(Color(.label))
                    .frame(
                        width: AlarmLayout.addButtonSize,
                        height: AlarmLayout.addButtonSize
                    )
                    .background(.regularMaterial, in: Circle())
            }
        }
        .padding(.trailing, AlarmLayout.buttonTrailingPadding)
        .padding(.top, AlarmLayout.buttonTopPadding)
    }

    /// アラームリストとサイレントモード注意書きのセクション
    private var alarmSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            // セクションラベル「アラーム」（Figma: 13px・白・SF Pro Regular）
            Text("アラーム")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.white)
                .padding(.horizontal, AlarmLayout.sectionLabelHorizontalPadding)
                .padding(.vertical, AlarmLayout.sectionLabelVerticalPadding)

            // アラーム行のリスト
            VStack(spacing: 0) {
                ForEach($viewModel.alarms) { $alarm in
                    AlarmRowView(alarm: $alarm)
                }
            }
            .background(Color.white.opacity(AlarmLayout.listBackgroundOpacity))
            .clipShape(RoundedRectangle(cornerRadius: AlarmLayout.listCornerRadius))

            // サイレントモード注意書き（仕様書の要件）
            Text("アラームを確実に鳴らすため、就寝前にサイレントモードを解除してご使用ください。")
                .font(.system(size: AlarmLayout.warningFontSize))
                .foregroundStyle(.white.opacity(AlarmLayout.warningOpacity))
                .padding(.horizontal, AlarmLayout.sectionLabelHorizontalPadding)
                .padding(.top, AlarmLayout.sectionLabelVerticalPadding)
                .padding(.bottom, AlarmLayout.warningBottomPadding)
        }
        .padding(.horizontal, AlarmLayout.horizontalMargin)
    }
}

#Preview {
    AlarmSetupView()
}

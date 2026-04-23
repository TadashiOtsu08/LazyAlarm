import SwiftUI

/// アラーム一覧・設定のメイン画面（ホーム）
struct AlarmSetupView: View {

    /// アラーム一覧の状態を管理するViewModel
    @State private var viewModel = AlarmSetupViewModel()

    /// Figmaのダークネイビー背景色（#010133）
    private let backgroundColor = Color(red: 1 / 255, green: 1 / 255, blue: 51 / 255)

    /// タブバーの選択中カラー（#0088ff）
    private let tabActiveColor = Color(red: 0, green: 136 / 255, blue: 1.0)

    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()

            VStack(spacing: 0) {
                addButtonRow
                Spacer() // キャラクター表示エリア（将来実装）
                alarmSection
                tabBar
            }
        }
    }

    /// 右上の新規アラーム追加ボタン（Liquid Glassスタイル）
    private var addButtonRow: some View {
        HStack {
            Spacer()
            Button(action: viewModel.addAlarm) {
                Image(systemName: "plus")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(Color(.label))
                    .frame(width: 48, height: 48)
                    .background(.regularMaterial, in: Circle())
            }
        }
        .padding(.trailing, 16)
        .padding(.top, 8)
    }

    /// アラームリストとサイレントモード注意書きのセクション
    private var alarmSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            // セクションラベル「アラーム」（Figma: 13px・白・SF Pro Regular）
            Text("アラーム")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)

            // アラーム行のリスト
            VStack(spacing: 0) {
                ForEach($viewModel.alarms) { $alarm in
                    AlarmRowView(alarm: $alarm)
                }
            }
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // サイレントモード注意書き（仕様書の要件）
            Text("アラームを確実に鳴らすため、就寝前にサイレントモードを解除してご使用ください。")
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.4))
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 51)
    }

    /// Home・Alertの2タブを持つボトムタブバー（Liquid Glassピル型）
    private var tabBar: some View {
        HStack(spacing: 0) {
            tabItem(title: "Home", icon: "alarm.fill", isSelected: true)
            tabItem(title: "Alert", icon: "bell.fill", isSelected: false)
        }
        .background(.regularMaterial, in: Capsule())
        .shadow(color: .black.opacity(0.12), radius: 20, y: 8)
        .padding(.horizontal, 25)
        .padding(.top, 16)
        .padding(.bottom, 25)
    }

    /// タブバーの各アイテムを生成する
    private func tabItem(title: String, icon: String, isSelected: Bool) -> some View {
        VStack(spacing: 1) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
            Text(title)
                .font(.system(size: 10, weight: .semibold))
                .tracking(-0.1)
        }
        .foregroundStyle(isSelected ? tabActiveColor : Color(.label))
        .frame(maxWidth: .infinity)
        .padding(.vertical, 7)
    }
}

#Preview {
    AlarmSetupView()
}

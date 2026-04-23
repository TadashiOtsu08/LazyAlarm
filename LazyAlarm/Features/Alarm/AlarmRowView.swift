import SwiftUI

/// アラーム一覧の1行分を表示するView
struct AlarmRowView: View {

    /// 表示・編集するアラームのバインディング
    @Binding var alarm: AlarmItem

    var body: some View {
        HStack(spacing: 0) {
            // 時刻とラベルを縦並びで表示
            VStack(alignment: .leading, spacing: 2) {
                Text(formattedTime)
                    .font(.system(size: 17, weight: .regular))
                    .tracking(-0.43)
                    .foregroundStyle(Color(white: 0.6))
                Text(alarm.label)
                    .font(.system(size: 15, weight: .regular))
                    .tracking(-0.23)
                    .foregroundStyle(Color(white: 0.6))
            }

            Spacer()

            // ON/OFFトグル（ピンクアクセントカラーを適用）
            Toggle("", isOn: $alarm.isEnabled)
                .labelsHidden()
                .tint(Color.accentPink)
        }
        .padding(.horizontal, AlarmLayout.rowHorizontalPadding)
        .padding(.vertical, AlarmLayout.rowVerticalPadding)
        // Figmaの区切り線（上端に薄い白線）
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color(white: 0.9, opacity: AlarmLayout.dividerOpacity))
                .frame(height: AlarmLayout.dividerHeight)
        }
    }

    /// Dateを "6:30" 形式の文字列に変換する
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm"
        return formatter.string(from: alarm.time)
    }
}

#Preview {
    AlarmRowView(alarm: .constant(AlarmItem(
        time: Calendar.current.date(bySettingHour: 6, minute: 30, second: 0, of: Date()) ?? Date(),
        label: "アラーム",
        isEnabled: true
    )))
    .background(Color.backgroundPrimary)
}

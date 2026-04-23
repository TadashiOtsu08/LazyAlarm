import SwiftUI

/// アラーム設定画面の状態を管理するViewModel
@Observable
final class AlarmSetupViewModel {

    /// 登録済みアラームの一覧
    var alarms: [AlarmItem] = [
        AlarmItem(
            time: Calendar.current.date(bySettingHour: 6, minute: 30, second: 0, of: Date()) ?? Date(),
            label: "アラーム",
            isEnabled: true
        )
    ]

    /// 新規アラームをデフォルト設定で追加する
    func addAlarm() {
        let alarm = AlarmItem(
            time: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date()) ?? Date(),
            label: "アラーム",
            isEnabled: true
        )
        alarms.append(alarm)
    }

    /// 指定インデックスのアラームを削除する
    func deleteAlarms(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
}

/// アラームのUI表示・操作用モデル（SwiftDataへの移行前の暫定モデル）
struct AlarmItem: Identifiable {
    /// 一意の識別子
    var id = UUID()
    /// アラームの設定時刻
    var time: Date
    /// アラームのラベル名
    var label: String
    /// アラームの有効・無効フラグ
    var isEnabled: Bool
}

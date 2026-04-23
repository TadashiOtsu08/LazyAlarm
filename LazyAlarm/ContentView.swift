import SwiftUI

/// アプリ全体のナビゲーションを管理するメインView
/// タブの追加・変更はすべてここで行う
struct ContentView: View {

    var body: some View {
        TabView {
            // ホームタブ：アラーム一覧・設定画面
            AlarmSetupView()
                .tabItem {
                    Label("Home", systemImage: SFSymbols.alarm)
                }

            // アラートタブ：スワイプパズル解除画面（将来実装）
            AlertView()
                .tabItem {
                    Label("Alert", systemImage: SFSymbols.bell)
                }

            // キャラクタータブ：キャラクター管理画面（将来実装）
            CharacterView()
                .tabItem {
                    Label("Character", systemImage: SFSymbols.character)
                }
        }
    }
}

#Preview {
    ContentView()
}

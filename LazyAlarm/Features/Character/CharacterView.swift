import SwiftUI

/// キャラクター管理画面（将来実装予定）
struct CharacterView: View {

    var body: some View {
        // TODO: キャラクター育成機能実装時に追加
        Text("CharacterView")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundPrimary.ignoresSafeArea())
    }
}

#Preview {
    CharacterView()
}

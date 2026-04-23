import SwiftUI

/// アラーム解除用スワイプパズル画面（将来実装予定）
struct AlertView: View {

    var body: some View {
        // TODO: スワイプパズル機能実装時に追加
        Text("AlertView")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.lazyBackground.ignoresSafeArea())
    }
}

#Preview {
    AlertView()
}

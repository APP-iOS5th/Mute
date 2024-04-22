import SwiftUI

struct SceneStorageView: View {
    
    @SceneStorage("mytext") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding()
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}

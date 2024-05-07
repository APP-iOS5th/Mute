import SwiftUI
import FirebaseFirestore


struct AddCommentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel.shared
    @State private var bodyText: String = ""
    var service: NoteService
    
    var body: some View {
        VStack {
            TextEditor(text: $bodyText)
                .border(.gray)
        }
        .padding(24)
        .navigationTitle("Add Comment")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await addComment()
                        dismiss()
                    }
                } label: {
                    Image(systemName: "checkmark")
                        .disabled(bodyText.isEmpty)
                }
            }
        }
    }
    
    func addComment() async {
        
    }
}

#Preview {
    AddCommentView(note: Note.sample)
}

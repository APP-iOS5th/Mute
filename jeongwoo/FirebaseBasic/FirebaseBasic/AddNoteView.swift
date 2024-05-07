import SwiftUI

struct AddNoteView: View {
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel()
    @State private var title: String = ""
    @State private var bodyText: String = ""
    @Environment(\.dismiss) var dismiss
    var service: NoteService?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                TextField("Title", text: $title)
                    .padding(4)
                    .border(.gray)
                TextEditor(text: $bodyText)
                    .border(.gray)
            }
            .padding(32)
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        service?.addNote(title: title, date: Date(), body: bodyText,
                                         author: authenticationViewModel.userID,
                                         username: authenticationViewModel.username,
                                         photoURL: authenticationViewModel.photoURL)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.headline)
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}


#Preview {
    AddNoteView(service: nil)
}

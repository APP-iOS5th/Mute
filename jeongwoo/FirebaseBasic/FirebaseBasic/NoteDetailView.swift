
import SwiftUI

struct NoteDetailView: View {
    var note: Note
    var body: some View {
        VStack {
            Text(note.title)
                .font(.headline)
                .fontWeight(.bold)
            TextEditor(text: .constant(note.body))
                .border(.gray)
        }
        .padding(24)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: {
                    AddCommentView(, service: note)
                }, label: {
                    HStack {
                        Image(systemImage: "text.bubble")
                        Text("Add Comment")
                    }
                })
                .padding()
                .border(.gray)
            }
        }
        .navigationTitle("Note Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note: Note.sampleWithLongBody)
    }
}

import Foundation
import FirebaseFirestore

class NoteService: ObservableObject {
    @Published var notes: [Note]
    private let dbCollection = Firestore.firestore().collection("notes")
    private var listener: ListenerRegistration?
    
    init(notes: [Note] = []) {
        self.notes = notes
        startRealtimeUpdate()
    }
    
    func fetch() {
        guard listener == nil else { return }
        dbCollection.getDocuments { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            updateNotes(snapshot: snapshot)
        }
    }
    
    func addNote(title: String, date: Date, body: String, author: String, username: String, photoURL: URL?) {
           print("Author: \(author)")
           let note = Note(id: UUID().uuidString, title: title, date: date, body: body,
                           author: author, username: username, photoURL: photoURL)
           _ = try? dbCollection.addDocument(from: note)
           fetch()
       }
    
    private func startRealtimeUpdate() {
        listener = dbCollection.addSnapshotListener { [self] QuerySnapshot, error in
            guard let snapshot = QuerySnapshot else {
                print("Error fetching snapshot: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print("New note: \(diff.document.data())")
                }
                if (diff.type == .modified) {
                    print("Modified note: \(diff.document.data())")
                }
                if (diff.type == .removed) {
                    print("Removed note: \(diff.document.data())")
                }
            }
            updateNotes(snapshot: snapshot)
        }
    }
    private func updateNotes(snapshot: QuerySnapshot) {
        let notes: [Note] = snapshot.documents.compactMap {document in
            try? document.data(as: Note.self)
        }
        self.notes = notes.sorted {
            $0.date < $1.date
        }
    }
}

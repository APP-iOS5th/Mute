import SwiftUI
import SwiftData

@Model
class Memo {
    var id: UUID
    var text: String
    var color: String
    var created: Date
    
    
    init(id: UUID = UUID(),text: String, color: String, created: Date) {
        self.id = id
        self.text = text
        self.color = color
        self.created = created
    }
}

struct ContentView: View {
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memos) { memo in
                    HStack {
                        VStack {
                            Text("\(memo.text)")
                                .font(.title)
                            Text("\(formattedDate(from: memo.created))")
                                .font(.body)
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(memoColor)
                    .shadow(radius: 5)
                    .padding()
                    .contextMenu {
                        Button(action: { removeMemo(memo) }) {
                            Label("삭제", systemImage: "trash.slash")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("memo")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("추가") {memoText = ""; isSheetShowing = true}
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                NavigationView {
                    MemoAddView(isSheetShowing: $isSheetShowing, memoText: $memoText, memoColor: $memoColor, colors: colors) { text, color in
                        let colorString = color.description
                        let memoColor = Color(colorString)
                        addMemo(text, color: memoColor)
                    }
                }
            }
        }
    }
    
    func addMemo(_ text: String, color: Color) {
        let colorString = color.description
        let memo = Memo(text: text, color: colorString, created: Date())
        modelContext.insert(memo)
    }
    
    func removeMemo(_ targetMemo: Memo) {
        modelContext.delete(targetMemo)
    }
    
    func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

struct MemoAddView: View {
    @Binding var isSheetShowing: Bool
    @Binding var memoText: String
    @Binding var memoColor: Color
    let colors: [Color]
    var onSave: (String, Color) -> Void
    
    var body: some View {
        VStack {
            Text("메모 추가")
                .font(.title)
                .padding()
            TextField("메모를 입력하세요", text: $memoText)
                .padding()
            Picker(selection: $memoColor, label: Text("색상")) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized)
                        .foregroundColor(color)
                        .tag(color)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
            Button("저장") {
                onSave(memoText, memoColor)
                isSheetShowing = false
            }
            .padding()
        }
        .navigationTitle("새 메모")
        .navigationBarItems(trailing: Button("닫기") {
            isSheetShowing = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: Memo.self)
    }
}

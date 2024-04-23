import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var memos: [Memo]
    @State var isSheetShowing: Bool = false
    let memoManager = MemoManager()
    
    var body: some View {
        NavigationStack {
            List (memos) { memo in
                HStack {
                    VStack {
                        Text("\(memo.text)")
                            .font(.title)
                        Text("\(memoManager.formattedDate(from: memo.created))")
                            .font(.body)
                            .padding(.top)
                        
                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background()
                    .shadow(radius: 5)
                    .padding()
                    .swipeActions(edge: .trailing) {
                        ShareLink(item: memo.text)
                        Button {
                            memoManager.removeMemo(memo)
                        } label: {
                            Label("Remove", systemImage: "trash.slash")
                        }
                    }
                    Spacer()
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("memo")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("추가") {
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(isSheetShowing:$isSheetShowing)
            }
        }
    }
}

struct MemoAddView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isSheetShowing: Bool
    @State var memoColor: Color = .brown
    @State var memoText: String = ""
    let memoManager = MemoManager()
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button("저장") {
                    memoManager.addMemo(memoText, color: memoColor)
                    isSheetShowing = false
                }
                .disabled(memoText.isEmpty)
            }
            .padding()
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark")
                            }
                            Spacer()
                        }
                        .frame(height: 40)
                        .background(color)
                        .foregroundStyle(.white)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            .padding()
            Divider()
                .padding()
            VStack {
                TextField("내용을 입력하세요", text: $memoText, axis: .vertical)
                    .padding()
                    .foregroundStyle(memoColor)
                    .shadow(radius: 4)
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: Memo.self)
    }
}

//
//  MemoAddView.swift
//  Memo
//
//  Created by 박지혜 on 4/23/24.
//

import SwiftUI

struct MemoAddView: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var isSheetShowing: Bool
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button("완료") {
                    // TODO: add Memo
//                    modelContext.insert()
                    addMemo(memoText, color: memoColor)
                    isSheetShowing = false
                }
                .disabled(memoText.isEmpty)
            }
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            // 컬러 선택시
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50) // 프레임 먼저 써줘야 함
                        .foregroundStyle(.white)
                        .background(color)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            Divider()
                .padding()
            VStack {
                TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                    .padding()
                    .foregroundStyle(.white)
                    .background(memoColor)
                    .shadow(radius: 3)
            }
            Spacer()
        }
        .padding()
    }
    
    func addMemo(_ text: String, color: Color) {
        let memo: Memo = Memo(text: text, color: color, created: Date())
        modelContext.insert(memo)
    }
}

//#Preview {
//    MemoAddView(isSheetShowing: .constant(true))
//        .modelContainer(for: Memo.self)
//}

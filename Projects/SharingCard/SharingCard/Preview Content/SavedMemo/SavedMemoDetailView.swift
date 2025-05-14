//
//  SavedMemoDetailView.swift
//  SharingCard
//
//  Created by bear on 4/18/25.
//

import SwiftUI

struct SavedMemoDetailView: View {
    
    let respondentName: String
    let memos: [SavedMemo]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
            List {
                ForEach(memos) { memo in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("🙋 질문")
                            .font(.headline)
                        Text(memo.question)
                            .font(.body)
                        Divider()
                        Text("📝 답변")
                            .font(.headline)
                        Text(memo.answer)
                            .font(.body)
                    }
                    //                .DataManager.deleteRecord {
                    //                }
                    //                .padding(.vertical, 8)
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        self.modelContext.delete(self.memos[index])
                        try? modelContext.save()
                    }
                    
                }
            }
            .navigationTitle(respondentName)
            .toolbar {
                EditButton()
            }
        }
    }


#Preview {
    SavedMemoDetailView(
        respondentName: "베어",
        memos: [
            SavedMemo(
                question: "예시 질문",
                answer: "예시 답변",
                emoji: "💬",
                respondent: "베어",
                date: Date()
            )
        ]
    )
}

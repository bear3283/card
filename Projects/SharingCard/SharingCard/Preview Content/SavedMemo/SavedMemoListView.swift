import SwiftUI
import SwiftData

struct SavedMemoListView: View {
    //    @Binding var savedMemos: [SavedMemo]
    //    @Query private var savedMemos: [SavedMemo]
    @Query private var records: [SavedMemo]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            let grouped = Dictionary(grouping: records, by: { $0.respondent })
            let sortedGroups = grouped.sorted(by: { $0.key < $1.key })
            
            ForEach(sortedGroups, id: \.key) { (name, memos) in
                NavigationLink(destination: SavedMemoDetailView(respondentName: name, memos: memos)) {
                    Text("\(name) [\(memos.count)]")
                        .padding(5)
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    records.forEach { record in
                        if record.respondent == sortedGroups[index].key {
                            modelContext.delete(record)
                        }
                    }
                    try? modelContext.save()
                }
            }
        }
        .navigationTitle("질문한 사람")
        .toolbar {
            EditButton()
        }
//                for item in 1...4 where item > 2 {
//                    print("item test: \(item)")
//                }
//                for item in 1...4 {
//                    if(item > 2) {
//                        print("item test: \(item)")
//                    }
//                }
//                
                
                    
//                    print("in forEach - index: \(index)")
//                    print("in forEach: \(sortedGroups[index].key)")
                    
        //        .onAppear() {
        //            //            let grouped_ = Dictionary(grouping: records, by: { $0.respondent })
        //            //            print("on Appear: \(grouped_)")
        //            //            let names = records.map { element in
        //            //                element.respondent
        //            //            }
        //            let names = records.map({ (element) -> String in
        //                return element.respondent
        //            })
        //            let names1 = records.map({ element in
        //                return element.respondent
        //            })
        //            let names2 = records.map { element in
        //                element.respondent
        //            }
        //            let names3 = records.map { $0.respondent }
        //
        //             표현할 수 있는 방법이 다수임!
        //
        //            print("on Appear respondents 1: \(names)")
        //            print("on Appear respondents 2: \(names1)")
        //            print("on Appear respondents 3: \(names2)")
        //            print("on Appear respondents 4: \(names3)")
        //        }
        // 프린트로 잘 되는지 찍어보는 방법
    }
}


import SwiftUI
import SwiftData

// MARK: - Main View
struct CategoryView: View {
    @Query private var savedMemos: [SavedMemo]
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - 2열 그리드 구성
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<categories.count, id: \.self) { index in
                NavigationLink(
                    destination: StartQuestionView(
                        categoryName: categories[index].name,
                        categoryIndex: index,
                        categoryColor: categories[index].color
                    )
                ) {
                    CategoryCardView(category: categories[index])
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SavedMemoListView()) {
                    Image(systemName: "archivebox.fill")
                }
            }
        }
    }
    
}


#Preview {
    NavigationStack {
        CategoryView()
    }
}

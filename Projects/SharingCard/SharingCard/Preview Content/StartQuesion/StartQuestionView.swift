import SwiftUI
import SwiftData

struct StartQuestionView: View {
    
    @Query private var records: [SavedMemo]
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    var savedMemos: [SavedMemo] = []
    @State private var questions: [QuestionItem] = []
    @State private var selectedQuestion: QuestionItem?
    @State private var showPopup: Bool = false
    @State private var animateScale = false
    @State private var showCelebration = false
    @State private var showSavePopup = false
    @State private var showToast = false
    @State private var memoText = ""
    @State private var respondentName = ""
    
    
    // 데이터의 원천, 스테이트 박혀있으면 원본, 바인딩은 누구한테 편집해줘라는 권한을 주는 것, 스테이트가 붙어있는 뷰가 바인딩의 주인
    // 스테이트, 변경의 어려움이 있어서 바인딩에게 주는 것이다
    // 바인딩의 주인이 아니다. 바인딩
    
    let categoryName: String
    let categoryIndex: Int
    let categoryColor: Color
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            VStack {
                Text("Question Card를 눌러 대화를 시작해요")
                    .font(.subheadline)
                
                
                if remainingQuestions.isEmpty {
                    celebrationView
                } else {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach($questions) { $question in
                            if !question.isHidden {
                                BackCardView(color: categoryColor)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedQuestion = question
                                            showPopup = true
                                            animateScale = true
                                        }
                                    }
                            } else {
                                WhiteCardView()
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(categoryName)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedMemoListView()
                        .environment(\.modelContext, modelContext)
                    ) {
                        Image(systemName: "archivebox.fill")
                    }
                }
            }
            // MARK: - 질문팝업
            if showPopup, let selected = selectedQuestion {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture{
                        dismissPopup(for: selected)
                    }
                
                VStack(spacing: 12) {
                    Text(selected.emoji)
                        .font(.system(size: 60))
                    Text(selected.text)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Spacer().frame(height:15)
                    
                    Button(action: {
                        withAnimation{
                            showSavePopup = true
                        }
                    })
                    {
                        Text("저장하기")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }}
                .frame(maxWidth: 300, maxHeight: 300)
                .padding()
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .scaleEffect(animateScale ? 1.05 : 1.0)
            }
            
            //MARK: - 저장팝업
            if showSavePopup {
                Color.black.opacity(0.4)
                    .onTapGesture {
                        showSavePopup = false
                    }
                
                VStack(spacing: 12) {
                    Text("누구에게 질문했나요?")
                        .font(.title3)
                    
                    // ✅ 답변자 이름
                    TextField("이름을 입력하세요", text: $respondentName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // ✅ 메모 텍스트
                    ZStack(alignment: .topLeading){
                        
                        TextEditor(text: $memoText)
                            .frame(height: 80)
                            .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray.opacity(0.4)))
                            .background(Color.white)
                            .cornerRadius(8)
                        if memoText.isEmpty {
                            Text("대화 내용을 입력하세요")
                                
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .padding(.top, 9)
                                .padding(.horizontal, 7)
                                
                        }
                    }
                    
                    HStack {
                        Button("취소") {
                            withAnimation {
                                showSavePopup = false
                            }
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        
                        
                        Button("저장") {
                            if let selected = selectedQuestion {
                                guard !respondentName.isEmpty else { return }
                               
                                DataManager.saveRecord(question: selected.text,
                                                       answer: memoText,
                                                       emoji: selected.emoji,
                                                       respondent: respondentName
                                                       ,in: modelContext)
                                respondentName = ""
                                
                                memoText = ""
                                showToast = true
                                showSavePopup = false
                                showPopup = false
                                dismissPopup(for: selected)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    withAnimation {
                                        showToast = false
                                    }
                                }
                            } else {

                                    showSavePopup = false
                                    showPopup = false
                            }
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .frame(width:  340, height: 280)
                .padding(.horizontal, 24)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .transition(.scale)
                
            }
            // MARK: - 토스트 팝업
            if showToast {
                VStack {
                    Spacer()
                    HStack(spacing: 8) {
                        Text("✅ 저장 완료!")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.black.opacity(0.85))
                    .cornerRadius(12)
                    .padding(.bottom, 40)
                    .transition(.opacity)
                }
                .animation(.easeInOut, value: showToast)
            }
        }
        .onAppear {
            loadQuestions()
        }
        
    }
    // MARK: - 축하 뷰
    var celebrationView: some View {
        VStack(spacing: 20) {
            Text("🎉 모든 질문을 완료했어요!")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Button("다시 시작") {
                withAnimation {
                    loadQuestions()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    
    var remainingQuestions: [QuestionItem] {
        questions.filter { !$0.isHidden }
    }
    
    // MARK: - 팝업 종료
    func dismissPopup(for question: QuestionItem) {
        if let index = questions.firstIndex(where: { $0.id == question.id }) {
            questions[index].isHidden = true
        }
        selectedQuestion = nil
        showPopup = false
        animateScale = false
    }
    //MARK: - 질문 로딩
    func loadQuestions() {
        print("categoryIndex: \(categoryIndex)")
        let all = QuestionBank.allCategories[categoryIndex]
        questions = Array(all.shuffled().prefix(8))
        print("questions: \(questions), count: \(questions.count)")
    }
}


#Preview {
    NavigationStack {
        StartQuestionView(
            categoryName: "Food",
            categoryIndex: 0,
            categoryColor: .red
        )
    }
}

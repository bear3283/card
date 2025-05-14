import SwiftUI

struct BackCardView: View {
    let rows = 10
    let columns = 8
    let color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(color)
                .frame(width: 180, height: 140)
            ZStack {
                color
                    .ignoresSafeArea()
                
                // 다이아몬드 패턴
                VStack(spacing: 10) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 10) {
                            ForEach(0..<columns, id: \.self) { column in
                                // 다이아몬드 모양 만들기
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                                    .rotationEffect(.degrees(45))
                                    .opacity(0.7)
                            }
                        }
                        // 짝수 줄은 들여쓰기 줘서 엇갈리게 배치
                        .offset(x: row % 2 == 0 ? 0 : 12)
                    }
                }
            }
            .frame(width: 170, height: 130)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                
                    .stroke(Color.white, lineWidth: 4)
            )
        }
    }
}


#Preview {
    BackCardView(color: .red)
}

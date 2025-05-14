//
//  HomeCardView.swift
//  SharingCard
//
//  Created by bear on 4/18/25.
//

import SwiftUI
// MARK: - 카드형 뷰 컴포넌트
struct HomeCardView: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(color)
                .frame(height: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(gradient: Gradient(colors: [color, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .opacity(0.08)
                        .frame(height: 180)
                )
                .shadow(radius: 4, y:4)
                
            
            VStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.callout)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding(.horizontal, 20)
    }
}
#Preview {
    HomeCardView(title: "Basic Card", subtitle: "주제별 질문 카드", icon: "square.grid.2x2", color: .blue)
}

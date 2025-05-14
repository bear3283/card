//
//  CategoryCardView.swift
//  SharingCard
//
//  Created by bear on 4/23/25.
//

import SwiftUI

struct CategoryCardView: View {
    let category: CategoryItem
    
    var body: some View {
        // MARK: - 카드 컴포넌트
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(category.color)
                .frame(height: 140)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(gradient: Gradient(colors: [category.color, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 140)
                        .opacity(0.08)
                )
                .shadow(radius: 4, y:4)
                
            
            VStack(spacing: 8) {
                Image(systemName: category.icon)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Text(category.name)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    CategoryCardView(category: CategoryItem(name: "Food", icon: "fork.knife", color: .red))
}

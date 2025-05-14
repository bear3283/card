//
//  QuestionCardView.swift
//  SharingCard
//
//  Created by bear on 4/17/25.
//

import SwiftUI

struct QuestionCardView: View {
    
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(color)
            .frame(height: 140)
            .overlay(
                Image(systemName: "questionmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [color, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 140)
                    .opacity(0.08)
            )
            .shadow(radius: 4, y:4)
    }
}

#Preview {
    QuestionCardView(color: .black)
}

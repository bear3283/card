//
//  ContentView.swift
//  SharingCard
//
//  Created by bear on 4/17/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                
//                ZStack {
//            
//                    Ellipse()
//                        .fill((LinearGradient(colors: [Color.blue, Color.purple], startPoint: .leading, endPoint: .trailing)))
//                        .frame(width: 300, height: 3)
//                        .blur(radius: 8)
//                        .offset(y:40)
//                    
//                    Text("OPEN Card")
//                        .font(.system(size: 60, weight: .semibold))
//                        .foregroundColor(.clear) // 텍스트 색 제거
//                        .overlay(
//                            LinearGradient(
//                                colors: [Color.blue, Color.purple],
//                                startPoint: .leading,
//                                endPoint: .trailing
//                            )
//                            .mask(
//                                Text("OPEN Card")
//                                    .font(.system(size: 60, weight: .semibold))
//                            )
//                        )
//                }

                Text("\"입도, 마음도 열리는 \n 질문 카드를 뽑고 대화 해봐요\"")
                    .font(.system(size: 17, weight: .regular))
                    .multilineTextAlignment(.center)
                
                Spacer().frame(height: 40)
                
                NavigationLink(destination: CategoryView()) {
                    HomeCardView(
                        title: "Category Card",
                        subtitle: "기본 주제별 카드",
                        icon: "square.grid.2x2",
                        color: .blue
                    )
                }
                
                // CustomCard (비활성화 또는 향후 확장용)
                HomeCardView(
                    title: "Custom Card [준비 중]",
                    subtitle: "나만의 질문 만들기",
                    icon: "pencil.and.outline",
                    color: .orange
                )
                
                Spacer().frame(height:30)
                
                
                
            }
            .padding()
//            .navigationTitle("Question Card")
//            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Question Card")
                        .font(.title)
                        .fontWeight(.semibold)
//                        .shadow(radius: 0.5, x:0.5, y:0.5)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedMemoListView()) {
                        
//                        Text("질문보관함")
//                            .shadow(color: Color.blue, radius: 0.5, x:0.5, y:0.5)
                        
                        Image(systemName: "archivebox.fill")
//                            .shadow(color: Color.blue, radius: 0.5, x:0.5, y:0.5)
                    }
                }
            }
        }
    }
    
}
#Preview {
    HomeView()
}

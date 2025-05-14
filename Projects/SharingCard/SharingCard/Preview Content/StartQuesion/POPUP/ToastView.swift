//
//  ToastView.swift
//  SharingCard
//
//  Created by bear on 4/17/25.
//

import SwiftUI

struct ToastView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("✅ 저장 완료!")
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.black.opacity(0.85))
            .cornerRadius(12)
            .padding(.bottom, 40)
        }
        .transition(.opacity)
    }
}

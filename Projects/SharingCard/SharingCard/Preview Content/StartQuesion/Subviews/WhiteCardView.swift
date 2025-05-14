//
//  QuestionCardView.swift
//  SharingCard
//
//  Created by bear on 4/17/25.
//

import SwiftUI

struct WhiteCardView: View {
    

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.white)
            .frame(height: 140)
            
    }
}

#Preview {
    WhiteCardView()
}

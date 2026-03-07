//
//  SectionHeaderView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct SectionHeaderView: View {
    var title: String
    var type: String

    var body: some View {
        HStack {
            Text("\(title)")
                .font(.appFont(size: 18, .semiBold))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.forward")
                .foregroundColor(.white)
                .padding(.leading, 20)
        }
        .padding(.horizontal, 20)
        .background(Color("#141520")) // Explicit background for floating behavior
        .listRowInsets(EdgeInsets()) // Ensure no default insets
    }
}

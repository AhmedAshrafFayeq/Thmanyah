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
            Text("\(title) (\(type))")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
                .padding(.leading, 20)
        }
        .padding()
        .background(Color("#141520")) // Explicit background for floating behavior
        .listRowInsets(EdgeInsets()) // Ensure no default insets
    }
}

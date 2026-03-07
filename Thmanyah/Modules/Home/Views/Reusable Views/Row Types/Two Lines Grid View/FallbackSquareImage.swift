//
//  FallbackSquareImage.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 07/03/2026.
//

import SwiftUI

struct FallbackSquareImage: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(white: 0.15))
            Image(systemName: "play.rectangle")
                .foregroundColor(.gray)
        }
        .frame(width: 65, height: 65)
    }
}

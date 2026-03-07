//
//  BigSquareView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

//
//  BigSquareView.swift
//  Thmanyah
//

import SwiftUI

struct BigSquareView: View {
    let items: [ContentData]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(items, id: \.id) { item in
                        BigSquareViewCardView(
                            item: item,
                            cardWidth: geometry.size.width - 55
                        )
                    }
                }
            }
        }
        .frame(height: 240)
    }
}


//
//  TwoLinesGridView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct TwoLinesGridView: View {
    var items: [ContentData]

    let rows = [
        GridItem(.fixed(85), spacing: 12),
        GridItem(.fixed(85), spacing: 12)
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(items, id: \.id) { item in
                    TwoLinesCardView(item: item)
                }
            }
        }
    }
}



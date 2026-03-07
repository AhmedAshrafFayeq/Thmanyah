//
//  HorizontalQueueView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct HorizontalQueueView: View {
    var items: [ContentData]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items, id: \.id) { item in
                    PodcastCardView(item: item)
                }
            }
        }
    }
}

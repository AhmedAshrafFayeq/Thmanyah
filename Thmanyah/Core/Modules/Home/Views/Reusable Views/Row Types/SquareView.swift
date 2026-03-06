//
//  SquareView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct SquareView: View {
    var items: [ContentData]
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) { // Enable horizontal scrolling
                LazyHStack {
                    ForEach(items, id: \.id) { item in
                        VStack(alignment: .leading) {
                            if let avatarURL = item.avatarURL {
                                AsyncImage(url: URL(string: avatarURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            Text("\(item.name ?? "") episodes")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        .frame(width: 120)
                    }
                }
            }
        }
    }
}

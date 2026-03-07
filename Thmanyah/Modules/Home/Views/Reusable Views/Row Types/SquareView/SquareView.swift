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
                LazyHStack(spacing: 12) {
                    ForEach(items, id: \.id) { item in
                        VStack(alignment: .leading) {
                            if let avatarURL = item.avatarURL {
                                AsyncImage(url: URL(string: avatarURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            Text("\(item.name ?? "") episodes")
                                .foregroundColor(.gray)
                                .font(.appFont(size: 12))
                        }
                        .frame(width: 120)
                    }
                }
            }
        }
    }
}

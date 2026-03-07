//
//  TwoLinesGridView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct TwoLinesGridView: View {
    var items: [ContentData]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: [GridItem(.flexible()), GridItem(.flexible())], // Ensure fixed heights for rows
                spacing: 12
            ) {
                ForEach(items, id: \.id) { item in
                    TwoLinesCardView(item: item)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct TwoLinesCardView: View {
    let item: ContentData

    var body: some View {
        HStack(spacing: 15) {
            // Image
            if let avatarURL = item.avatarURL {
                AsyncImage(url: URL(string: avatarURL)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(item.podcastName ?? "")
                    .font(.appFont(size: 14, .semiBold))
                    .foregroundColor(.gray)

                Text(item.name ?? "")
                    .font(.appFont(size: 10))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()

            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .bold))
                .padding(8)
                .background(Color.black.opacity(0.6))
                .clipShape(Circle())
        }
        .padding(10)
        .background(Color("#272937"))
        .cornerRadius(15)
    }
}

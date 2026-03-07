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

struct BigSquareViewCardView: View {
    let item: ContentData
    let cardWidth: CGFloat

    var body: some View {
        VStack(spacing: 12) {
            if let avatarURL = item.avatarURL,
               let url = URL(string: avatarURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(item.name ?? "")
                    .font(.appFont(size: 18, .semiBold))
                    .lineLimit(2)
                    .foregroundColor(.white)

                if let description = item.description {
                    Text(description)
                        .font(.appFont(size: 14, .medium))
                        .foregroundColor(.gray)
                        .lineLimit(3)
                }

                Text((item.releaseDate ?? "").toFormattedDate())
                    .font(.appFont(size: 12))
                    .foregroundColor(.gray)
            }

            Spacer(minLength: 0)
        }
        .padding(8)
        .background(Color("#272937"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: cardWidth)
    }
}

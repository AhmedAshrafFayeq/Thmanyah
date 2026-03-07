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


struct PodcastCardView: View {
    let item: ContentData

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            // Podcast Image
            AsyncImage(url: URL(string: item.avatarURL ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.2)
                    ProgressView()
                }
            }
            .frame(width: 180, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            .overlay(alignment: .bottomTrailing) {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.appFont(size: 12, .bold))
                    .padding(8)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
            }

            VStack(alignment: .leading, spacing: 6) {

                // Podcast Name
                Text(item.name ?? "")
                    .foregroundColor(.white)
                    .font(.appFont(size: 14, .semiBold))
                    .lineLimit(1)

                // Description
                Text(item.description ?? "")
                    .font(.appFont(size: 10))
                    .foregroundColor(.gray)
                    .lineLimit(2)

                // Episodes + Duration
                HStack(spacing: 6) {

                    if let episodes = item.episodeCount {
                        Label("\(episodes)", systemImage: "music.note.list")
                            .font(.appFont(size: 12))
                    }

                    if let duration = item.duration {
                        Label(duration.formattedDuration, systemImage: "clock")
                            .font(.appFont(size: 12))
                    }
                }
                .foregroundColor(.gray)

            }
        }
        .frame(width: 180)
    }
}


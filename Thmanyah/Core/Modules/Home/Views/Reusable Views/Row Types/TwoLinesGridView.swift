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

// MARK: - Enhanced Card Sub-view
struct TwoLinesCardView: View {
    let item: ContentData

    let cardWidth: CGFloat = 300

    let darkCardBackground = Color(red: 39/255, green: 41/255, blue: 55/255)

    var body: some View {
        HStack(spacing: 12) {
            if let avatarURL = item.avatarURL {
                AsyncImage(url: URL(string: avatarURL)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 65, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                FallbackSquareImage()
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(timeAgoDisplay(from: item.releaseDate))
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .textCase(.uppercase)

                Text(item.name ?? "Unknown Title")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(1)

                if let subtitle = item.authorName ?? item.podcastName, !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
            }

            Spacer(minLength: 0)

            Image(systemName: "play.circle.fill")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.trailing, 4)
        }
        .padding(10)
        .frame(width: cardWidth, alignment: .leading)
        .background(darkCardBackground)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
    }

    // MARK: - Helper Functions

    private func timeAgoDisplay(from dateString: String?) -> String {
        guard let dateString = dateString else { return "Recently" }
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        if let date = formatter.date(from: dateString) {
            return relativeTimeString(for: date)
        }

        formatter.formatOptions = [.withInternetDateTime]
        if let fallbackDate = formatter.date(from: dateString) {
            return relativeTimeString(for: fallbackDate)
        }
        return "Recently"
    }

    private func relativeTimeString(for date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

// MARK: - Fallback Image View
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


//struct TwoLinesGridView: View {
//    var items: [ContentData]
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            LazyHGrid(
//                rows: [GridItem(.flexible()), GridItem(.flexible())], // Ensure fixed heights for rows
//                spacing: 12
//            ) {
//                ForEach(items, id: \.id) { item in
//                    TwoLinesCardView(item: item)
//                        .cornerRadius(15)
//                }
//            }
//        }
//    }
//}
//
//struct TwoLinesCardView: View {
//    let item: ContentData
//
//    var body: some View {
//        HStack(spacing: 15) {
//            // Image
//            if let avatarURL = item.avatarURL {
//                AsyncImage(url: URL(string: avatarURL)) { image in
//                    image.resizable()
//                        .scaledToFill()
//                } placeholder: {
//                    Color.gray
//                }
//                .frame(width: 70, height: 70)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//            }
//
//            VStack(alignment: .leading, spacing: 6) {
//                Text(item.podcastName ?? "")
//                    .font(.appFont(size: 14, .semiBold))
//                    .foregroundColor(.gray)
//
//                Text(item.name ?? "")
//                    .font(.appFont(size: 10))
//                    .foregroundColor(.gray)
//                    .lineLimit(2)
//            }
//            Spacer()
//
//            Image(systemName: "play.fill")
//                .foregroundColor(.white)
//                .font(.system(size: 12, weight: .bold))
//                .padding(8)
//                .background(Color.black.opacity(0.6))
//                .clipShape(Circle())
//        }
//        .padding(10)
//        .background(Color("#272937"))
//        .cornerRadius(15)
//    }
//}

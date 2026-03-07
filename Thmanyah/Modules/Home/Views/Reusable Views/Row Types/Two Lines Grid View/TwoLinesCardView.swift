//
//  TwoLinesCardView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 07/03/2026.
//

import SwiftUI

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
                    .font(.appFont(size: 10, .bold))
                    .foregroundColor(.white)
                    .textCase(.uppercase)

                Text(item.name ?? "")
                    .font(.appFont(size: 14, .semiBold))
                    .foregroundColor(.white)
                    .lineLimit(1)

                if let subtitle = item.authorName ?? item.podcastName, !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.appFont(size: 12))
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

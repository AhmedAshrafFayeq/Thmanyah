//
//  String+Extension.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation
internal import UIKit

extension String {

    private static let isoFormatterWithMS: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        return formatter
    }()

    private static let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withInternetDateTime
        ]
        return formatter
    }()

    private static let displayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    func toFormattedDate() -> String {
        guard !isEmpty else { return "" }

        let date =
            Self.isoFormatterWithMS.date(from: self) ??
            Self.isoFormatter.date(from: self)

        guard let date else { return "" }

        return Self.displayFormatter.string(from: date)
    }
}


extension String {

    var htmlToPlainText: String {
        guard let data = data(using: .utf8) else { return self }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        let attributed = try? NSAttributedString(
            data: data,
            options: options,
            documentAttributes: nil
        )

        return attributed?.string
            .replacingOccurrences(of: "\n\n", with: "\n")
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? self
    }
}


extension String {
    var displayYear: String? {
        Self.flexibleDateParsers.lazy
            .compactMap { $0.date(from: self) }
            .first
            .map { Self.yearFormatter.string(from: $0) }
    }

    private static let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()

    private static let flexibleDateParsers: [DateFormatter] = {
        let formats = [
            "yyyy-MM-dd'T'HH:mm:ssZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            "yyyy-MM-dd"
        ]

        return formats.map { format in
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter
        }
    }()
}

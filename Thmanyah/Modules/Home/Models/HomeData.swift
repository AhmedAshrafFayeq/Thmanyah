//
//  HomeData.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation

// MARK: - HomeData

struct HomeData: Codable {
    var sections: [SectionData]?
    var pagination: PaginationData?
}

// MARK: - Pagination

struct PaginationData: Codable {
    var nextPage: String?
    var totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}

// MARK: - Section

struct SectionData: Codable, Equatable, Hashable, Identifiable {
    var id = UUID()
    var name: String?
    var contentType: ContentTypeEnum?
    var type: DisplayTypeEnum?
    var order: Int?
    var content: [ContentData]?

    enum CodingKeys: String, CodingKey {
        case name, type
        case contentType = "content_type"
        case order, content
    }
}

// MARK: - Content

struct ContentData: Codable, Equatable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    var podcastID, name, description: String?
    var avatarURL: String?
    var episodeCount, duration: Int?
    var language: String?
    var priority, popularityScore: Int?
    var score: Double?
    var podcastPopularityScore, podcastPriority: Int?
    var episodeID: String?
    var seasonNumber: Int?
    var episodeType: String?
    var podcastName: String?
    var authorName: String?
    var number: Int?
    var separatedAudioURL, audioURL: String?
    var releaseDate: String?
    var chapters: [String]?
    var paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    var paidTranscriptURL, freeTranscriptURL: String?
    var paidIsExclusivePartially: Bool?
    var paidExclusiveStartTime: Int?
    var paidEarlyAccessDate, paidEarlyAccessAudioURL, paidExclusivityType: String?
    var audiobookID: String?
    var articleID: String?

    enum CodingKeys: String, CodingKey {
        case podcastID = "podcast_id"
        case name, description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration, language, priority, popularityScore, score, podcastPopularityScore, podcastPriority
        case episodeID = "episode_id"
        case seasonNumber = "season_number"
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case number
        case separatedAudioURL = "separated_audio_url"
        case audioURL = "audio_url"
        case releaseDate = "release_date"
        case chapters
        case paidIsEarlyAccess = "paid_is_early_access"
        case paidIsNowEarlyAccess = "paid_is_now_early_access"
        case paidIsExclusive = "paid_is_exclusive"
        case paidTranscriptURL = "paid_transcript_url"
        case freeTranscriptURL = "free_transcript_url"
        case paidIsExclusivePartially = "paid_is_exclusive_partially"
        case paidExclusiveStartTime = "paid_exclusive_start_time"
        case paidEarlyAccessDate = "paid_early_access_date"
        case paidEarlyAccessAudioURL = "paid_early_access_audio_url"
        case paidExclusivityType = "paid_exclusivity_type"
        case audiobookID = "audiobook_id"
        case articleID = "article_id"
    }
}

enum DisplayTypeEnum: String, Codable {
    case bigSquareWithDash = "big_square"
    case bigSquare = "big square"
    case square
    case queue
    case TwoLinesGrid = "2_lines_grid"
}

enum ContentTypeEnum: String, Codable {
    case podcast
    case episode
    case audioBooks = "audio_book"
    case audioArticle = "audio_article"
}

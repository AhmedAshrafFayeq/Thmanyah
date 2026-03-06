//
//  HomeEndpoint.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation

enum HomeEndpoint: BaseEndpoint {
    case getHome(page: Int)

    var path: String {
        switch self {
        case .getHome:
            return "home_sections"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getHome:
            return .get
        }
    }

    var parameters: Parameters {
        switch self {
        case let .getHome(page):
            return ["page": page]
        }
    }
}

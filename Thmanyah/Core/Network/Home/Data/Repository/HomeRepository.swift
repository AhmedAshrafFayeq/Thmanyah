//
//  HomeRepository.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    var homeService: HomeServiceProtocol

    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
    }

    func fetchHome(at page: Int) async throws -> HomeModel {
        do {
            let homeDTO = try await homeService.fetchHome(at: page)
            return homeDTO.mapToDomain()
        } catch {
            let networkError = error as? NetworkError ?? .connectionFailed
            throw networkError
        }
    }
}

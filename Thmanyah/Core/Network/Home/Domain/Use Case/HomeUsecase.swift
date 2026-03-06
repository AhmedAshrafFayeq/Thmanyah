//
//  HomeUsecase.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

protocol HomeUseCase {
    func fetchHome(at page: Int) async throws -> HomeModel
}

class DefaultHomeUseCase: HomeUseCase {
    private let homeRepository: HomeRepository

    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }

    func fetchHome(at page: Int) async throws -> HomeModel {
        return try await homeRepository.fetchHome(at: page)
    }
}


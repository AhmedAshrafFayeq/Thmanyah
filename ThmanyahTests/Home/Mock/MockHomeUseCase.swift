//
//  MockHomeUseCase.swift
//  ThmanyahTests
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation
@testable import Thmanyah

class MockHomeUseCase: HomeUseCase {
    var mockData: HomeModel?
    var shouldThrowError: Bool = false

    init(mockData: HomeModel? = nil, shouldThrowError: Bool = false) {
        self.mockData = mockData
        self.shouldThrowError = shouldThrowError
    }

    func fetchHome(at _: Int) async throws -> HomeModel {
        if shouldThrowError {
            throw NetworkError.invalidResponse
        }
        return mockData ?? HomeModel(sections: [], pagination: nil)
    }
}

//
//  HomeRepositoryProtocol.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

protocol HomeRepositoryProtocol {
    func fetchHome(at page: Int) async throws -> HomeModel
}

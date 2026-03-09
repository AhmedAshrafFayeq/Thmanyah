//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let homeUseCase: HomeUseCase

    @Published var homeDataSectionList: [SectionData] = []
    @Published var isloading = false
    @Published var errorMessage = ""
    @Published var searchText: String = "" {
        didSet {
            applySearch()
        }
    }

    // Keep original data for local search
    private var allHomeDataSectionList: [SectionData] = []

    // pagination
    var pageNumber = 0
    var reachedEnd: Bool = false

    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
}

// MARK: - Helpers

extension HomeViewModel {
    var shouldPaginate: Bool {
        searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func isLastSection(_ section: SectionData) -> Bool {
        homeDataSectionList.last?.id == section.id
    }

    private func applySearch() {
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedSearch.isEmpty else {
            homeDataSectionList = allHomeDataSectionList
            return
        }

        let query = trimmedSearch.lowercased()

        homeDataSectionList = allHomeDataSectionList.compactMap { section in
            let sectionMatches = section.name?.lowercased().contains(query) == true

            let filteredContent = (section.content ?? []).filter { item in
                item.name?.lowercased().contains(query) == true ||
                item.description?.lowercased().contains(query) == true ||
                item.authorName?.lowercased().contains(query) == true ||
                item.podcastName?.lowercased().contains(query) == true
            }

            if sectionMatches {
                return section
            }

            guard !filteredContent.isEmpty else { return nil }

            var copiedSection = section
            copiedSection.content = filteredContent
            return copiedSection
        }
    }
}

// MARK: - Network

extension HomeViewModel {
    @MainActor
    func fetchHomeData(showLoader: Bool = false) async {
        guard !reachedEnd else { return }
        guard shouldPaginate else { return }

        if showLoader { isloading = true }
        pageNumber += 1

        do {
            let homeData = try await homeUseCase.fetchHome(at: pageNumber).mapToPresentation()
            let newSections = homeData.sections ?? []

            allHomeDataSectionList.append(contentsOf: newSections)
            applySearch()

            if let totalPages = homeData.pagination?.totalPages, pageNumber >= totalPages {
                reachedEnd = true
            }

            isloading = false
        } catch let error as NetworkError {
            isloading = false
            errorMessage = error.errorDescription ?? ""
        } catch {
            isloading = false
            errorMessage = "unknown error"
        }
    }
}

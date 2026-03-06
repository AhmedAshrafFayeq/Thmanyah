//
//  HomeViewModelTests.swift
//  ThmanyahTests
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Testing
@testable import Thmanyah

struct HomeViewModelTests {
    
    @MainActor
    @Test
    func testFetchHomeDataSuccess() async throws {
        // Arrange
        let mockSections = [
            SectionModel(name: "Section 1", type: "square", contentType: "podcast", order: 1, content: []),
            SectionModel(name: "Section 2", type: "queue", contentType: "episode", order: 2, content: [])
        ]
        let mockPagination = PaginationModel(nextPage: "/page/2", totalPages: 2)
        let mockData = HomeModel(sections: mockSections, pagination: mockPagination)
        let mockUseCase = MockHomeUseCase(mockData: mockData)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)
        
        // Act
        await viewModel.fetchHomeData()
        
        // Assert
        #expect(viewModel.homeDataSectionList.count == 2)
        #expect(viewModel.homeDataSectionList[0].name == "Section 1")
        #expect(viewModel.reachedEnd == false)
        #expect(viewModel.pageNumber == 1)
    }
    
    @MainActor
    @Test
    func testFetchHomeDataEmptySections() async throws {
        // Arrange
        let mockData = HomeModel(
            sections: [],
            pagination: PaginationModel(nextPage: nil, totalPages: 1)
        )
        let mockUseCase = MockHomeUseCase(mockData: mockData)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)
        
        // Act
        await viewModel.fetchHomeData()
        
        // Assert
        #expect(viewModel.homeDataSectionList.isEmpty)
        #expect(viewModel.reachedEnd == true)
        #expect(viewModel.pageNumber == 1)
    }
    
    @MainActor
    @Test
    func testFetchHomeDataFailure() async throws {
        // Arrange
        let mockUseCase = MockHomeUseCase(shouldThrowError: true)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)
        
        // Act
        await viewModel.fetchHomeData()
        
        // Assert
        #expect(viewModel.homeDataSectionList.isEmpty)
        #expect(viewModel.reachedEnd == false)
        #expect(viewModel.isloading == false)
    }
    
    @MainActor
    @Test
    func testLoaderState() async throws {
        // Arrange
        let mockData = HomeModel(
            sections: [],
            pagination: PaginationModel(nextPage: nil, totalPages: 1)
        )
        let mockUseCase = MockHomeUseCase(mockData: mockData)
        let viewModel = HomeViewModel(homeUseCase: mockUseCase)
        
        // Act
        await viewModel.fetchHomeData(showLoader: true)
        
        // Assert
        #expect(viewModel.isloading == false)
    }
}

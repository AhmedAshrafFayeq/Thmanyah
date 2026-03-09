//
//  HomeView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 0) {
            HomeHeaderView()

            SearchBarView(searchText: $viewModel.searchText)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
                .background(Color("#141520"))

            List {
                ForEach(viewModel.homeDataSectionList, id: \.id) { section in
                    Section(
                        header: SectionHeaderView(
                            title: section.name ?? "",
                            type: section.contentType?.rawValue ?? ""
                        )
                    ) {
                        switch section.type {
                        case .bigSquare, .bigSquareWithDash:
                            BigSquareView(items: section.content ?? [])

                        case .square:
                            SquareView(items: section.content ?? [])

                        case .queue:
                            HorizontalQueueView(items: section.content ?? [])

                        case .TwoLinesGrid:
                            TwoLinesGridView(items: section.content ?? [])

                        case .none:
                            Text("No display type defined")
                                .foregroundColor(.white)
                        }
                    }
                    .onAppear {
                        if viewModel.shouldPaginate,
                           viewModel.isLastSection(section) {
                            Task {
                                await viewModel.fetchHomeData()
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }

                if viewModel.homeDataSectionList.isEmpty && !viewModel.searchText.isEmpty {
                    Text("No results found")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color("#141520"))
        }
        .modifier(ProgressLoader(isLoading: viewModel.isloading == true))
        .background(Color("#141520").ignoresSafeArea())
        .task {
            await viewModel.fetchHomeData(showLoader: true)
        }
    }
}

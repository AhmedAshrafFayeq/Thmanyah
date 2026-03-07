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
                        if viewModel.homeDataSectionList.last == section {
                            Task {
                                await viewModel.fetchHomeData()
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .background(Color("#141520"))
        }
        .modifier(ProgressLoader(isLoading: viewModel.isloading == true))
        .background(Color("#141520").edgesIgnoringSafeArea(.all))
        .task {
            await viewModel.fetchHomeData(showLoader: true)
        }
    }
}


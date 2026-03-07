//
//  ThmanyahApp.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

@main
struct ThmanyahApp: App {
    var body: some Scene {
        WindowGroup {
            let homeUseCase = DefaultHomeUseCase(
                homeRepository: HomeRepository(
                    homeService: HomeService()
                )
            )
            let viewModel = HomeViewModel(homeUseCase: homeUseCase)

            SplashView {
                HomeView(viewModel: viewModel)
            }
        }
    }
}

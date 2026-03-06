//
//  ProgressLoader.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI
import Lottie

struct ProgressLoader: ViewModifier {

    var isLoading: Bool

    func body(content: Content) -> some View {
        content
            .disabled(isLoading)
            .overlay {
                if isLoading {
                    ZStack {
                        Color.black.opacity(0.15)
                            .ignoresSafeArea()

                        LottieView(animation: .named("loader"))
                            .playing(loopMode: .loop)
                            .animationSpeed(1)
                            .frame(width: 120, height: 120)
                    }
                }
            }
    }
}

extension View {
    func progressLoader(_ isLoading: Bool) -> some View {
        modifier(ProgressLoader(isLoading: isLoading))
    }
}

//
//  SplashView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 07/03/2026.
//

import SwiftUI

struct SplashView<Content: View>: View {

    @State private var isActive = false
    @State private var opacity = 0.5

    let themeYellow = Color(red: 1.0, green: 0.733, blue: 0.0)
    let darkBackground = Color.black

    let nextView: Content

    init(@ViewBuilder nextView: () -> Content) {
        self.nextView = nextView()
    }

    var body: some View {
        if isActive {
            nextView
        } else {
            ZStack {
                darkBackground.ignoresSafeArea()

                Image("Thmanyah-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            opacity = 1.0
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

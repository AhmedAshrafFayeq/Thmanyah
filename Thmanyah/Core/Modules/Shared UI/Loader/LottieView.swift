//
//  LottieView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI
import Lottie

struct LottieLoaderView: View {

    let fileName: String
    var loopMode: LottieLoopMode = .loop
    var speed: CGFloat = 1.0

    var body: some View {
        LottieView(animation: .named(fileName))
            .playing(loopMode: loopMode)
            .animationSpeed(speed)
            .frame(width: 120, height: 120)
    }
}

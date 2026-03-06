//
//  HomeHeaderView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            // Profile Icon
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)

            // Greeting Text and Icon
            HStack {
                Text("مرحباً احمد")
                    .foregroundColor(.white)
                    .font(.appFont(size: 18, .bold))
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.yellow)
            }


            Spacer()

            // Notification Icon with Badge
            ZStack(alignment: .topTrailing) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)

                // Red Badge
                Text("4")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Circle().foregroundColor(.red))
                    .offset(x: 10, y: -10)
            }
        }
        .padding()
        .background(Color("#141520"))
        .environment(\.layoutDirection, .rightToLeft)
    }
}

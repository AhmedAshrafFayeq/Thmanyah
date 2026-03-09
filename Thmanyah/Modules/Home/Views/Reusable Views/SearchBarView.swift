//
//  SearchBarView.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 09/03/2026.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack(spacing: 10) {

            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(
                "",
                text: $searchText,
                prompt: Text("Search podcasts, episodes, audiobooks...")
                    .foregroundColor(.gray)
            )
            .foregroundColor(.white)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)

            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(Color("#272937"))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

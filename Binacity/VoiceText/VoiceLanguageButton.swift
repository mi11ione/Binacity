//
//  VoiceLanguageButton.swift
//  Binacity
//
//  Created by mi11ion on 14.02.2024.
//

import SwiftUI

struct LanguageButton: View {
    var options = ["en-US", "ru-RU"]
    
    @State private var isMenuOpen: Bool = false
    @State var selectedOption: Set<String> = []
    
    var lang: String {
        return selectedOption.joined(separator: ", ")
    }

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    toggleOption(option)
                }) {
                    HStack {
                        Text(option)
                        Spacer()
                        if selectedOption.contains(option) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Text("Language")
                .font(.headline).bold()
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
        }
        .padding(.trailing)
    }

    private func toggleOption(_ option: String) {
        selectedOption.removeAll()
        selectedOption.insert(option)
    }
}

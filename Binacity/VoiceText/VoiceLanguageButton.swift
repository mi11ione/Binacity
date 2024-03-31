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
    @State var selectedOption: Set<String> = ["en-US"]

    @EnvironmentObject var swiftUISpeech: SwiftUISpeech

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
        .actionSheet(isPresented: $isMenuOpen) {
            ActionSheet(title: Text("Select Language"), message: nil, buttons: [
                .default(Text("English"), action: { toggleOption("en-US") }),
                .default(Text("Russian"), action: { toggleOption("ru-RU") }),
                .cancel(),
            ])
        }
    }

    private func toggleOption(_ option: String) {
        selectedOption.removeAll()
        selectedOption.insert(option)

        swiftUISpeech.selectedLanguage = option
    }
}

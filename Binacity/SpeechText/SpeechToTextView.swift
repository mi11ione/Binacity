//
//  SpeechToTextView.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI
import Speech

struct SpeechToTextView: View {
    @EnvironmentObject var swiftUISpeech: SwiftUISpeech
    @EnvironmentObject var states: States
    var translationSpeech: String {
        return dictionary.reduce(self.swiftUISpeech.outputText) { $0.replacingOccurrences(of: $1.key, with: $1.value) }
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Speech to binary")
                        .font(.title).bold()
                        .padding([.top, .leading])
                    Image("speechMemoji")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                }

                Text("Next we're capturing your voice, transcribing it using SFSpeechRecognizer\n\n1. Press the record button\n\n2. Say something, like your name\n\n3. See it translated into binary!")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding([.bottom, .leading])
                swiftUISpeech.getButton()
                    .padding(.vertical)
                    .padding(.bottom)

                Form {
                    Text("Original Text")
                        .fontWeight(.bold)
                    Text("\(swiftUISpeech.outputText)")
                        .font(.body)
                        .fontWeight(.bold)

                    Text("Translated to binary")
                        .fontWeight(.bold)
                    Text("\(translationSpeech)")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

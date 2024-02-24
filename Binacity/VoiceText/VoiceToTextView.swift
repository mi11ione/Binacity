//
//  VoiceToTextView.swift
//  Binacity
//
//  Created by mi11ion on 13.02.2024.
//

import SwiftUI
import Speech

struct VoiceToTextView: View {
    @EnvironmentObject var swiftUISpeech: SwiftUISpeech
    
    var translationVoice: String {
        convertToBinary(swiftUISpeech.outputText)
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Voice to binary")
                        .font(.title).bold()
                        .padding([.top, .leading])
                    Image("speechMemoji")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    LanguageButton()
                        .padding(.top, 10)
                }

                Text("Next we're capturing your voice, transcribing it using SFSpeechRecognizer\n\n1. Press the record button\n\n2. Say something, like your name\n\n3. See it translated into binary!")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding([.bottom, .leading])
                SwiftUISpeech().getButton()
                    .padding(.vertical)
                    .padding(.bottom)

                List {
                    Section(header: Text("Original Text").fontWeight(.bold)) {
                        Text(swiftUISpeech.outputText)
                            .padding(.vertical, 7)
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    
                    Section(header: Text("Translated to binary").fontWeight(.bold)) {
                        Text(translationVoice)
                            .padding(.vertical, 7)
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

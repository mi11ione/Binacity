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
            VStack(alignment: .center, spacing: 8) {
                Spacer()
                Image("speechMemoji")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(18)
                    .modifier(OutlineOverlay(cornerRadius: 18))

                Text("Speech to binary")
                    .font(.title).bold()
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("Next we're capturing your voice, transcribing it using SFSpeechRecognizer and then translating it to binary. \n\n1. Press the record button \n\n2. Wait 1 second \n\n3. Say something, like your name \n\n4. See it translated in binary! \n\nthis primarly used SFSpeechRecognizer to be able to transcribe what you're saying. \n\nAfter transcribing it used the binary alphabet model again to translate it to binary 🧮")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                swiftUISpeech.getButton()
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
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
            Section {
                if !states.HomeScreen {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                states.PhotoToBinary = false
                                states.SpeechToBinary = false
                                states.TextToBinary = true
                                states.FirstWelcome = false
                                states.HomeScreen = false
                            }
                        }, label: {
                            HStack {
                                Text("Next")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical)
                                    .padding(.leading)
                                Image(systemName: "chevron.right")
                                    .font(.headline)
                            }
                        })
                        Spacer()
                    }
                    .padding(.bottom)
                } else {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                states.PhotoToBinary = false
                                states.SpeechToBinary = false
                                states.TextToBinary = false
                                states.FirstWelcome = false
                                states.HomeScreen = false
                                states.Intro = true
                            }
                        }, label: {
                            HStack {
                                Text("Start Introduction Again")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical)
                                    .padding(.leading)
                                Image(systemName: "repeat")
                                    .font(.headline)
                            }
                        })
                        .padding(.bottom)
                        Spacer()
                    }
                }
            }
        }
    }
}

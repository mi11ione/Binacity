//
//  TextToBinary.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct TextToBinary: View {
    @EnvironmentObject var states: States
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    var tipPercentage = ["Binary", "Normal"]
    @State private var selectedColor = "Binary"
    @FocusState private var amountIsFocused: Bool
    var translation: String {
        return dictionary.reduce(self.checkAmount) {
            $0.replacingOccurrences(of: $1.key, with: $1.value)
        }
    }

    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 8) {
                Spacer()
                Image("typeMemoji")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(18)
                    .modifier(OutlineOverlay(cornerRadius: 18))

                Text("Typing to binary")
                    .font(.title).bold()
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("Last but not least, we are translating live! \n\n1. Tap the texfield \n\n2. Just type your text in the textfield and you'll see it in binary in real time! \n\n3. Type something like what your mood is today 🌞 \n\n4. Read it in binary \n\nThis method is not using VisionKit or SFSpeechRecognizer. \n\nIt is the only method using just the binary alphabet model.")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
            }
            Form {
                Section {
                    TextField("Input", text: $checkAmount)
                    Section {
                        Text("Original text")
                            .font(.headline)
                            .padding(.top)
                        Text(checkAmount)

                        Text("Translated to binary")
                            .font(.headline)
                            .padding(.top)
                        Text(translation)
                    }
                }
            }
            Section {
                if !states.HomeScreen {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                states.PhotoToBinary = false
                                states.SpeechToBinary = false
                                states.TextToBinary = false
                                states.FirstWelcome = false
                                states.HomeScreen = false
                                states.Outro = true
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
                    .padding(.bottom, UIScreen.main.bounds.height * 0.07)
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
                                states.Outro = false
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
                        .padding(.bottom, UIScreen.main.bounds.height * 0.07)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Live text to binary")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

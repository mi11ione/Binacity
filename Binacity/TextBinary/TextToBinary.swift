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
        convertToBinary(checkAmount)
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Typing to binary")
                        .font(.title).bold()
                        .padding([.top, .leading])
                    Image("typeMemoji")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                }
                
                Text("Last but not least, we are translating live now!\n\n1. Tap the texfield \n\n2. Type something like what your mood is today 🌞\n\n3. Read it in binary!")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding([.bottom, .leading])

                Form {
                    Text("Original text")
                        .fontWeight(.bold)
                    TextField("Type something", text: $checkAmount)
                    
                    Text("Translated to binary")
                        .fontWeight(.bold)
                    Text(translation)
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
                    } else {
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
                                Image(systemName: "repeat")
                                    .font(.headline)
                            }
                            .padding(.bottom)
                        })
                        .padding()
                    }
                }
            }
        }
    }
}

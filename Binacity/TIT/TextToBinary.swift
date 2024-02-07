//
//  TextToBinary.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct TextToBinary: View {
    @EnvironmentObject var states : States
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    var tipPercentage = ["Binary", "Normal"]
    @State private var selectedColor = "Binary"
    
    @FocusState private var amountIsFocused: Bool
    var translation: String {
        let dictionary = [
            "A": "01000001",
            "B": "01000010",
            "C": "01000011",
            "D": "01000100",
            "E": "01000101",
            "F": "01000110",
            "G": "01000111",
            "H": "01001000",
            "I": "01001001",
            "J": "01001010",
            "K": "01001011",
            "L": "01001100",
            "M": "01001101",
            "N": "01001110",
            "O": "01001111",
            "P": "01010000",
            "Q": "01010001",
            "R": "01010010",
            "S": "01010011",
            "T": "01010100",
            "U": "01010101",
            "V": "01010110",
            "W": "01010111",
            "X": "01011000",
            "Y": "01011001",
            "Z": "01011010",
            "a": "01100001",
            "b": "01100010",
            "c": "01100011",
            "d": "01100100",
            "e": "01100101",
            "f": "01100110",
            "g": "01100111",
            "h": "01101000",
            "i": "01101001",
            "j": "01101010",
            "k": "01101011",
            "l": "01101100",
            "m": "01101101",
            "n": "01101110",
            "o": "01101111",
            "p": "01110000",
            "q": "01110001",
            "r": "01110010",
            "s": "01110011",
            "t": "01110100",
            "u": "01110101",
            "v": "01110110",
            "w": "01110111",
            "x": "01111000",
            "y": "01111001",
            "z": "01111010"
        ]
        return dictionary.reduce(self.checkAmount) { $0.replacingOccurrences(of: $1.key, with: $1.value) }
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
                        Button (action: {
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
                        Button (action: {
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

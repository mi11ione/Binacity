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
                
                Text("Last but not least, we are translating live now!\n\n1. Tap the texfield \n\n2. Type something\n\n3. Read it in binary!")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding([.bottom, .leading])
                
                List {
                    Section(header: Text("Original text").fontWeight(.bold)) {
                        TextField("Type something", text: $checkAmount)
                            .padding(.vertical, 7)
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .focused($amountIsFocused)
                    }
                    
                    Section(header: Text("Translated to binary").fontWeight(.bold)) {
                        Text(translation)
                            .padding(.vertical, 7)
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }
                .gesture(
                    TapGesture().onEnded {
                        amountIsFocused = false
                    }
                )
            }
        }
    }
}

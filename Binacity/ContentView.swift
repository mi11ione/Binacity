//
//  ContentView.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var states: States
    @AppStorage("introCompleted") private var introCompleted = false

    var body: some View {
        Group {
            if !introCompleted {
                Intro(onIntroCompleted: {
                    self.introCompleted = true
                    states.HomeScreen = true
                })
            } else {
                if states.PhotoToBinary {
                    PhotoToTextView()
                } else if states.TextToBinary {
                    TextToBinary()
                } else if states.SpeechToBinary {
                    SpeechToTextView()
                } else if states.Outro {
                    Outro()
                } else {
                    HomeScreen()
                }
            }
        }
    }
}

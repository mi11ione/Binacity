//
//  ContentView.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var states : States

    var body: some View {
        if states.Intro {
            Intro()
        }

        if states.PhotoToBinary {
            PhotoToTextView()
        }

        if states.TextToBinary {
            TextToBinary()
        }

        if states.SpeechToBinary {
            SpeechToTextView()
        }

        if states.HomeScreen {
            HomeScreen()
        }

        if states.Outro {
            Outro()
        }
    }
}

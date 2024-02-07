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
                .preferredColorScheme(.dark)
        }
        
        if states.PhotoToBinary {
            PhotoToTextView()
                .preferredColorScheme(.dark)
        }
        
        if states.Outro {
            Outro()
                .preferredColorScheme(.dark)
        }
        
        if states.TextToBinary {
            TextToBinary()
                .preferredColorScheme(.dark)
        }
        
        if states.SpeechToBinary {
            SpeechToTextView()
                .preferredColorScheme(.dark)
        }
        
        if states.HomeScreen {
            HomeScreen()
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}

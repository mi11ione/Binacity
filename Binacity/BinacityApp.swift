//
//  BinacityApp.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TextItem())
                .environmentObject(States())
                .environmentObject(Model())
                .environmentObject(SwiftUISpeech())
        }
    }
}

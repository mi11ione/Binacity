//
//  States.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import Foundation

class States: ObservableObject {
    @Published var VoiceToBinary: Bool = false
    @Published var TextToBinary: Bool = false
    @Published var PhotoToBinary: Bool = false
    @Published var HomeScreen: Bool = false
    @Published var Intro: Bool = true
}

//
//  Tab.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Photo", icon: "camera", color: .teal, selection: .photo),
    TabItem(name: "Speech", icon: "mic.fill", color: .blue, selection: .speech),
    TabItem(name: "Text", icon: "bubble.left.fill", color: .red, selection: .text),
]

enum Tab: String {
    case photo
    case speech
    case text
}
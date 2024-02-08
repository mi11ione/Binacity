//
//  ModelPhoto.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import Foundation

class TextItem: Identifiable, ObservableObject {
    var id: String
    var text: String = ""
    var newText: String {
        return dictionary.reduce(self.text) {
            $0.replacingOccurrences(of: $1.key, with: $1.value)
        }
    }
    
    init() {
        id = UUID().uuidString
    }
}


class RecognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}

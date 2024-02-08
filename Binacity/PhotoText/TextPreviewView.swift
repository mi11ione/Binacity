//
//  TextPreviewView.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct TextPreviewView: View {
    var text: String
    var body: some View {
        VStack {
            Text(text)
                .font(.body)
                .padding()
        }
    }
}

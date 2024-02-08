//
//  HomeScreen.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var model: Model
    @AppStorage("selectedTab") var selectedTab: Tab = .photo
    @AppStorage("showAccount") var showAccount = false

    init() {
        showAccount = false
    }

    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .photo:
                    PhotoToTextView()
                case .speech:
                    SpeechToTextView()
                case .text:
                    TextToBinary()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 44)
            }
            TabBar()
        }
        .dynamicTypeSize(.large ... .xxLarge)
    }
}

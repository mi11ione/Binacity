//
//  Outro.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct Outro: View {
    @EnvironmentObject var states : States
    
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    
    @EnvironmentObject var model: Model
    @Namespace var namespace
    
    var body: some View {
        VStack {
            TabView {
                outroItem()
                    .cornerRadius(30)
                    .modifier(OutlineModifier(cornerRadius: 30))
                    .shadow(color: Color("Shadow").opacity(0.3),
                            radius: 10, x: 0, y: 30)
                    .overlay(
                        Image("partyMemoji")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 50, y: -100)
                            .frame(height: 230)
                    )
                    .padding(20)
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
            }
            .padding(.horizontal)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 460)
            .background(
                Image("Blob")
                    .offset(x: 250, y: -100)
                    .accessibility(hidden: true)
            )
            Button (action: {
                withAnimation {
                    states.PhotoToBinary = false
                    states.VoiceToBinary = false
                    states.TextToBinary = false
                    states.FirstWelcome = false
                    states.HomeScreen = true
                    states.Intro = false
                    states.Outro = false
                }
            }, label: {
                HStack {
                    Text("Go Home")
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        .padding(.leading)
                    Image(systemName: "house.fill")
                        .font(.headline)
                }
            })
        }
    }
}

struct outroItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image(systemName: "visionpro")
                .frame(width: 26, height: 26)
                .cornerRadius(10)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .modifier(OutlineOverlay(cornerRadius: 18))
            Text("We're done!")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("This is my take on implementing binary using multiple methods\n\nI hope you enjoyed it and learned something from my app!\n\nI wish you a wonderful day 🤩")
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .backgroundColor(opacity: 0.5)
    }
}

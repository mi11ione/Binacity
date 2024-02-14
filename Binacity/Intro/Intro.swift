//
//  Intro.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct Intro: View {
    @EnvironmentObject var states : States
    var onIntroCompleted: () -> Void
    
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]

    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    
    @EnvironmentObject var model: Model
    @Namespace var namespace
    
    var body: some View {
        VStack {
            TabView {
                ForEach(courses) { course in
                    GeometryReader { proxy in
                        FeaturedItem(course: course)
                            .cornerRadius(30)
                            .modifier(OutlineModifier(cornerRadius: 30))
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minX / -10),
                                axis: (x: 0, y: 1, z: 0), perspective: 1
                            )
                            .shadow(color: Color("Shadow").opacity(0.3),
                                    radius: 30, x: 0, y: 30)
                            .overlay(
                                Image(course.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .offset(x: 50, y: course.height-270)
                                    .frame(height: course.height)
                                    .offset(x: proxy.frame(in: .global).minX / 2)
                            )
                            .padding(20)
                            .onTapGesture {
                                showCourse = true
                                selectedCourse = course
                            }
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 460)
            .background(
                Image("Blob")
                    .offset(x: 250, y: -100)
                    .accessibility(hidden: true)
            )
            Button(action: {
                withAnimation {
                    states.PhotoToBinary = false
                    states.VoiceToBinary = false
                    states.TextToBinary = false
                    states.HomeScreen = true
                    states.Intro = false
                    onIntroCompleted()
                }
            }, label: {
                HStack {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        .padding(.leading)
                    Image(systemName: "chevron.right")
                        .font(.headline)
                }
            })
        }
    }
}

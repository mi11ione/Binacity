//
//  Course.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var height: CGFloat
}

var courses = [
    Course(index: 1, title: "Hey there!", text: "Welcome to Binacity\nI'll keep it short 🤏 \n\nPlease swipe left until you've reached the end of the introduction ✅ \nThen click Get Started 🙀", image: "welcomeMemoji", background: "Background 5", logo: "welcomeMemoji", height: 130),
    Course(index: 2, title: "Binacity", text: "I decided to create an app in which you get some knowledge about binary🤓 \n\nI've accomplished this using three methods of translating to binary ✅", image: "boxMemoji", background: "Background 4", logo: "boxMemoji", height: 130),
    Course(index: 2, title: "What even is binary?", text: "In short, binary is a system used by computers, by which values are expressed in 0's and 1's\n\nWould you look at that:\n01100100010101001101", image: "questionMemoji", background: "Background 4", logo: "questionMemoji", height: 130),
    Course(index: 3, title: "Computers and binary", text: "A bit is the smallest unit of data on a computer. Each bit has a single value of either 1 or 0 \n\nExecutable programs are often identified as binary files (binaries)", image: "macbookMemoji", background: "Background 1", logo: "macbookMemoji", height: 130),
    Course(index: 4, title: "What about numbers??", text: "Binary numbers look strange when they are written out directly\n\nThis is because the digits' weight increases by powers of 2\n🤓🤓🤓🤓 + 🤓🤓 = 110", image: "mindblownMemoji", background: "Background 2", logo: "mindblownMemoji", height: 130),
    Course(index: 4, title: "Looks crazy", text: "In a digital numeral, the digit furthest to the right is the ones digit\n\nThe next digit to the left is the twos digit, next comes the fours digit, then the eights digit and so on", image: "shhMemoji", background: "Background 2", logo: "shhMemoji", height: 130),
    Course(index: 3, title: "The binary alphabet", text: "There is also a binary alphabet\n\nA for example is: 01000001, whereas a (not capital) is: 01100001\n\nI'll be using this alphabet here", image: "ideaMemoji", background: "Background 1", logo: "ideaMemoji", height: 130),
    Course(index: 3, title: "Main technologies used", text: "SwiftUI \n\nVisionKit \n\nSFSpeechRecognizer", image: "photoMemoji", background: "Background 1", logo: "photoMemoji", height: 130),
    Course(index: 3, title: "Let's get started!", text: "I can explain binary for daaays to you, however, it's better to see it in action 🎯 Now tap Get Started!", image: "startMemoji", background: "Background 1", logo: "startMemoji", height: 230)
]

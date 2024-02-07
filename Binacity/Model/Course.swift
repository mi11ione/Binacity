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
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var height: CGFloat
}

var courses = [
    Course(index: 1, title: "Hey there! \n(Swipe this card left before clicking Get Started 🗣️)", subtitle: "Join me", text: "\nWelcome to Binacity. This is probably not your first app so I'll keep it short 🤏 \n\nPlease swipe left until you've reached the end of the introduction ✅ \n\nThen click Get Started 🙀", image: "welcomeMemoji", background: "Background 5", logo: "welcomeMemoji", height: 130),
    Course(index: 2, title: "Binacity", subtitle: "20 sections - 3 hours", text: "I decided to create an app in which you get some knowledge about binary.🤓 \n\nI've accomplished this using three methods of translating to binary ✅", image: "boxMemoji", background: "Background 4", logo: "boxMemoji", height: 130),
    Course(index: 2, title: "What even is binary?", subtitle: "20 sections - 3 hours", text: "In short, binary is a system used by computers, by which values are expressed in 0's and 1's.", image: "questionMemoji", background: "Background 4", logo: "questionMemoji", height: 130),
    Course(index: 3, title: "Computers and binary", subtitle: "20 sections - 3 hours", text: "\nA bit (short for binary digit) is the smallest unit of data on a computer; each bit has a single value of either 1 or 0. \n\nExecutable (ready-to-run) programs are often identified as binary files and given a file name extension of .bin. \n\nProgrammers often call executable files binaries.", image: "macbookMemoji", background: "Background 1", logo: "macbookMemoji", height: 130),
    Course(index: 4, title: "How does it work with numbers", subtitle: "20 sections - 3 hours", text: "Binary numbers look strange when they are written out directly. This is because the digits' weight increases by powers of 2. \n\nIn a digital numeral, the digit furthest to the right is the ones digit; the next digit to the left is the twos digit; next comes the fours digit, then the eights digit and so on.\n\nThe decimal equivalent of a binary number can be found by summing all the digits. For example, the binary 10101 is equivalent to the decimal 2^0 + 2^2 + 2^4 = 21", image: "mindblownMemoji", background: "Background 2", logo: "mindblownMemoji", height: 130),
    Course(index: 3, title: "The binary alphabet", subtitle: "20 sections - 3 hours", text: "There is also a binary alphabet. A for example is: 01000001, whereas a (not capital) is: 01100001. I'll be using this alphabet primarly in this app.", image: "ideaMemoji", background: "Background 1", logo: "ideaMemoji", height: 130),
    Course(index: 3, title: "Main technologies used", subtitle: "20 sections - 3 hours", text: "SwiftUI \n\nVisionKit \n\nSFSpeechRecognizer", image: "photoMemoji", background: "Background 1", logo: "photoMemoji", height: 130),
    Course(index: 3, title: "Let's get started!", subtitle: "20 sections - 3 hours", text: "I can explain binary for daaays to you, however, it's better to see it in action 🎯 Now tap Get Started!", image: "startMemoji", background: "Background 1", logo: "startMemoji", height: 230),
]

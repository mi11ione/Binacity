//
//  PhotoToTextView.swift
//  Binacity
//
//  Created by mi11ion on 07.02.2024.
//

import SwiftUI

struct PhotoToTextView: View {
    @ObservedObject var recognizedContent = RecognizedContent()
    @State private var showScanner = false
    @State private var isRecognizing = false

    @EnvironmentObject var states: States
    @EnvironmentObject var text: TextItem

    @State var color: Color = .teal
    @State var selectedX: CGFloat = 0
    @State var x: [CGFloat] = [0, 0, 0, 0]
    
    @EnvironmentObject var model: Model
    @AppStorage("selectedTab") var selectedTab: Tab = .photo

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Photo to binary")
                        .font(.title).bold()
                        .padding([.top, .leading])
                    Image("photoMemoji")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                }

                Text("We're gonna get started with translating text from a photo to binary using the binary alphabet using VisionKit!\n\n1. Press the Scan button \n\n2. Make a picture with some text in it\n\n3. Click Save\n\n4. See your text translated into binary")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding([.bottom, .horizontal])

                Form {
                    ForEach(recognizedContent.items, id: \.id) { textItem in
                        VStack {
                            Text("Original Text")
                                .fontWeight(.bold)
                            TextPreviewView(text: textItem.text)
                            Text("Translated to binary")
                                .fontWeight(.bold)
                            TextPreviewView(text: textItem.newText)
                        }
                    }

                    if isRecognizing {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color(UIColor.systemIndigo)))
                            .padding(.bottom, 20)
                    }

                    HStack {
                        Button(action: {
                            guard !isRecognizing else { return }
                            showScanner = true
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Scan")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                    .padding(.vertical)
                                Image(systemName: "doc.text.viewfinder")
                                    .font(.headline)
                                Spacer()
                            }
                        })
                    }
                }
                .sheet(isPresented: $showScanner, content: {
                    ScannerView { result in
                        switch result {

                        case .success(let scannedImages):
                            isRecognizing = true
                            TextRecognition(scannedImages: scannedImages, recognizedContent: recognizedContent) {
                                isRecognizing = false
                            }
                            .recognizeText()

                        case .failure(let error):
                            print(error.localizedDescription)
                        }

                        showScanner = false
                    } didCancelScanning: {
                        showScanner = false
                    }
                })
            }
        }
    }
}

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

                List {
                    ForEach(recognizedContent.items, id: \.id) { textItem in
                        Section(header: Text("Original Text").fontWeight(.bold)) {
                            VStack(alignment: .leading) {
                                Text(textItem.text)
                                    .padding(.vertical, 7)
                                    .background(Color(.secondarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 9))
                                    .font(.body)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Section(header: Text("Translated to binary").fontWeight(.bold)) {
                            VStack(alignment: .leading) {
                                Text(textItem.newText)
                                    .padding(.vertical, 7)
                                    .background(Color(.secondarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 9))
                                    .font(.body)
                                    .fontWeight(.bold)
                            }
                        }
                    }

                    if isRecognizing {
                        Section {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color(UIColor.systemIndigo)))
                                .scaleEffect(1.5)
                                .padding()
                        }
                    }

                    Section {
                        Button(action: {
                            guard !isRecognizing else { return }
                            showScanner = true
                        }) {
                            HStack {
                                Spacer()
                                Text("Scan")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                Image(systemName: "doc.text.viewfinder")
                                    .font(.headline)
                                Spacer()
                            }
                            .background(Color(.secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                        }
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

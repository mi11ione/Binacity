//
//  VoiceButton.swift
//  Binacity
//
//  Created by mi11ion on 13.02.2024.
//

import SwiftUI
import Speech

struct VoiceButton: View {
    @State var isPressed: Bool = false
    @State var actionPop: Bool = false
    @EnvironmentObject var swiftUISpeech: SwiftUISpeech

    var body: some View {
        Button(action: {
            if (self.swiftUISpeech.getVoiceStatus() == "Denied - Close the App") {
                self.actionPop.toggle()
            } else {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.swiftUISpeech.isRecording.toggle()}
                self.swiftUISpeech.isRecording ? self.swiftUISpeech.startRecording() : self.swiftUISpeech.stopRecording()
            }
        }) {
            Image(systemName: "waveform")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.lightGrey)
                .background(swiftUISpeech.isRecording ? Circle().foregroundColor(.red).frame(width: 85, height: 85): Circle().foregroundColor(.accentColor).frame(width: 70, height: 70))
        }
        .actionSheet(isPresented: $actionPop) {
            ActionSheet(title: Text("ERROR: - 1"), message: Text("Access Denied by User"), buttons: [ActionSheet.Button.destructive(Text("Go to Settings"))])
        }
    }
}

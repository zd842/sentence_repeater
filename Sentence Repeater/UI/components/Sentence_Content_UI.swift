//
//  Sentence_Content_UI.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

struct Sentence_Content_UI: View {
    @EnvironmentObject var fetch_voice_workflow_object: Fetch_voice_from_apply_synth
    @State private var sentence_content: String = ""
    var body: some View {
        TextField("input a sentence", text: $sentence_content, axis: .vertical)
            .font(Font.system(size: 50, weight: .semibold, design: .monospaced))
            .fixedSize(horizontal: false, vertical: true)
            .textFieldStyle(.roundedBorder)
            .padding(3)
            .onSubmit {
                fetch_voice_workflow_object.input_text = sentence_content
            }
    }
}

struct Sentence_Content_UI_Previews: PreviewProvider {
    static var previews: some View {
        Sentence_Content_UI()
    }
}

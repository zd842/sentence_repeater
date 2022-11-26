//
//  Sentence_Content_UI.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

struct Sentence_Content_UI: View {
    @State private var sentence_content: String = ""
    var body: some View {
        TextField("input a sentence", text: $sentence_content)
            .frame(height: 50)
            .border(Color.cyan)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct Sentence_Content_UI_Previews: PreviewProvider {
    static var previews: some View {
        Sentence_Content_UI()
    }
}

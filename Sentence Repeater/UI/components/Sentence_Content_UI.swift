//
//  Sentence_Content_UI.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

struct Sentence_Content_UI: View {
//    @EnvironmentObject var fe
    @State private var sentence_content: String = ""
    var body: some View {
        TextField("input a sentence", text: $sentence_content)
            .font(Font.system(size: 50, weight: .semibold, design: .monospaced))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
}

struct Sentence_Content_UI_Previews: PreviewProvider {
    static var previews: some View {
        Sentence_Content_UI()
    }
}

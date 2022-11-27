//
//  Control_Buttons_UI.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import SwiftUI

struct Control_Buttons_UI: View {
    var body: some View {
        HStack {
            Button(action: {
                print("repetitively play")
            }, label: {
                Image(systemName: "gobackward")
            })
        }
    }
}

struct Control_Buttons_UI_Previews: PreviewProvider {
    static var previews: some View {
        Control_Buttons_UI()
    }
}

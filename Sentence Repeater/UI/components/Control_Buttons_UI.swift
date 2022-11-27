//
//  Control_Buttons_UI.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import SwiftUI

struct Control_Buttons_UI: View {
    var fetch_voice_from_Azure = Fetch_Voice_from_Azure()
    @State private var value = 0
    let step = 3
    let range = 1...50
    
    var body: some View {
        HStack {
            Spacer()
            Stepper(value: $value,
                     in: range,
                     step: step) {
                Text("\(value) times")
                    .font(.system(.footnote))
            }
                     .frame(width: 170)
                     .foregroundColor(Color.white)
            Text("|")
            Button(action: {
                print("repetitively play")
            }, label: {
                Image(systemName: "gobackward")
                    .foregroundColor(Color.white)
            })
            Text("|")
            Button(action: {
                print("one-time-shot play")
                fetch_voice_from_Azure.synthesisToSpeaker()
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(Color.white)
            })
            Spacer()
        }
    }
}

struct Control_Buttons_UI_Previews: PreviewProvider {
    static var previews: some View {
        Control_Buttons_UI()
    }
}

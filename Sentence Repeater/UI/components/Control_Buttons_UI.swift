//
//  Control_Buttons_UI.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import SwiftUI

struct Control_Buttons_UI: View {
    var fetch_voice_from_Azure = Fetch_Voice_from_Azure()
    @EnvironmentObject var fetch_voice_workflow_object: Fetch_Voice_from_Azure

//    @State private var input_text: String = "here is another one"
//    @State private var value: Int = 0
    let step = 3
    let range = 0...50
    
    var body: some View {
        HStack {
            Spacer()
            Stepper(value: $fetch_voice_workflow_object.times,
                     in: range,
                     step: step) {
                Text("\($fetch_voice_workflow_object.times.wrappedValue) times")
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
                fetch_voice_from_Azure.synthesisToSpeaker(times: $fetch_voice_workflow_object.times.wrappedValue, input_text: $fetch_voice_workflow_object.input_text.wrappedValue)
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

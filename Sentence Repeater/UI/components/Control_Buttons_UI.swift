//
//  Control_Buttons_UI.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import SwiftUI

struct Control_Buttons_UI: View {
    @EnvironmentObject var fetch_voice_workflow_object: Fetch_Voice_from_Azure

    let step = 3
    let range = 0...50
    
    var body: some View {
        HStack {
            Spacer()
            Text("\($fetch_voice_workflow_object.times.wrappedValue) times")
                .font(.system(.footnote))
            Button(action: {}, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(Color.white)
            })
            Button(action: {}, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(Color.white)
            })
            Button(action: {}, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(Color.white)
            })
            Text("|")
            Button(action: {
                print("one-time-shot play")
                fetch_voice_workflow_object.synthesisToSpeaker(times: 0, input_text: $fetch_voice_workflow_object.input_text.wrappedValue)
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

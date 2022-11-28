//
//  Control_Buttons_UI.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import SwiftUI

struct Control_Buttons_UI: View {
    @EnvironmentObject var fetch_voice_workflow_object: Fetch_voice_from_apply_synth

//    let step = 3
//    let range = 0...50
    
    var body: some View {
        HStack {
            
            Button(action: {
                fetch_voice_workflow_object.resetTimes()
            }, label: {
                Image(systemName: "goforward")
                    .foregroundColor(Color.white)
            })
            Text("\($fetch_voice_workflow_object.times.wrappedValue) times  <- +")
                .font(.system(.footnote))
            
            Button(action: {
                fetch_voice_workflow_object.increseTimes(step: 1)
            }, label: {
                Image(systemName: "1.circle")
                    .foregroundColor(Color.white)
            })
            Button(action: {
                fetch_voice_workflow_object.increseTimes(step: 5)
            }, label: {
                Image(systemName: "5.circle")
                    .foregroundColor(Color.white)
            })
            Button(action: {
                fetch_voice_workflow_object.increseTimes(step: 10)
            }, label: {
                Image(systemName: "10.circle")
                    .foregroundColor(Color.white)
            })
            Text("|")
            Button(action: {
                print("one-time-shot play")
                fetch_voice_workflow_object.synthesisToSpeaker(times: $fetch_voice_workflow_object.times.wrappedValue, input_text: $fetch_voice_workflow_object.input_text.wrappedValue)
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(Color.white)
            })
            Button(action: {
                print("\(Int.max)")
                fetch_voice_workflow_object.synthesisToSpeaker(times: fetch_voice_workflow_object.repeat_value, input_text: $fetch_voice_workflow_object.input_text.wrappedValue)
            }, label: {
                Image(systemName: "repeat.circle")
                    .foregroundColor(Color.white)
            })
            Button(action: {
                fetch_voice_workflow_object.stopStythesis()
            }, label: {
                Image(systemName: "stop.circle")
                    .foregroundColor(Color.white)
            })
            
        }
    }
}

struct Control_Buttons_UI_Previews: PreviewProvider {
    static var previews: some View {
        Control_Buttons_UI()
    }
}

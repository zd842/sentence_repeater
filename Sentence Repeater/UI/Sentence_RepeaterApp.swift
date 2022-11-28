//
//  Sentence_RepeaterApp.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

@main
struct Sentence_RepeaterApp: App {
    @StateObject var fetch_voice_workflow_object = Fetch_voice_from_apply_synth()
    var body: some Scene {
        WindowGroup {
            HStack{
                VStack {
                    Language_Change_List_UI()
                    Control_Buttons_UI()
                        .frame(height: 30)
                }
                .background(Color.cyan)
                
                Sentence_Content_UI()
            }
            .environmentObject(fetch_voice_workflow_object)
        }
    }
}

//
//  Sentence_RepeaterApp.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

@main
struct Sentence_RepeaterApp: App {
    var body: some Scene {
        WindowGroup {
            HStack{
                VStack {
                    Language_Change_List_UI()
                    Control_Buttons_UI()
                }
                
                Sentence_Content_UI()
            }
        }
    }
}

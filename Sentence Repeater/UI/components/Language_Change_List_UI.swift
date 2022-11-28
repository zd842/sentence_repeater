//
//  Language_Change_List_UI.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

struct Language_Change_List_UI: View {
    
    @EnvironmentObject var fetch_voice_workflow_object: Fetch_voice_from_apply_synth
    
    enum Language_option: String, CaseIterable, Identifiable {
        case Japanese, English, Taiwanese
        var id: Self { self }
    }
    
    enum Language_voice: String, CaseIterable, Identifiable {
        case jap_1, jap_2, eng_1, eng_2, tw_1
        var id: Self { self }
    }
    
    
    @State private var selectedLanguage: Language_option = .Japanese
    @State private var selectedVoice: Language_voice = .jap_1
    @State private var selectedSpeed: Int = 0
    
    var body: some View {
        List {
            Picker("Language", selection: $selectedLanguage) {
                Text("Japanese").tag(Language_option.Japanese)
                Text("English").tag(Language_option.English)
                Text("Taiwanese").tag(Language_option.Taiwanese)
            }
//            Picker("Voice", selection: $selectedVoice) {
//                if selectedLanguage == .English {
//                    Text("eng_1").tag(Language_voice.eng_1)
//                    Text("eng_2").tag(Language_voice.eng_2)
//                } else if selectedLanguage == .Japanese {
//                    Text("jap_1").tag(Language_voice.jap_1)
//                    Text("jap_2").tag(Language_voice.jap_2)
//                } else {
//                    Text("tw_1").tag(Language_voice.tw_1)
//                }
//            }
            Picker("Speed", selection: $selectedSpeed) {
                Image(systemName: "tortoise").tag(0)
                Image(systemName: "hare").tag(1)
                Image(systemName: "bird").tag(2)
            }
            .onChange(of: selectedSpeed) {tag in fetch_voice_workflow_object.change_rate(rate: tag) }
        }
    }
}

struct Language_Change_List_UI_Previews: PreviewProvider {
    static var previews: some View {
        Language_Change_List_UI()
    }
}

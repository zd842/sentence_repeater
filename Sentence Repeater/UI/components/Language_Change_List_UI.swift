//
//  Language_Change_List_UI.swift
//  Sentence Repeater
//
//  Created by macos on 26/11/2022.
//

import SwiftUI

struct Language_Change_List_UI: View {
    
    enum Language_option: String, CaseIterable, Identifiable {
        case Japanese, English, Taiwanese
        var id: Self { self }
    }
    
    enum Language_voice: String, CaseIterable, Identifiable {
        case jap_1, jap_2, eng_1, eng_2, tw_1
        var id: Self { self }
    }
    
    enum Word_up: String, CaseIterable, Identifiable {
        case s0_9, s1_0, s1_2, s1_5, s2_0
        var id: Self { self }
    }
    
    @State private var selectedLanguage: Language_option = .Japanese
    @State private var selectedVoice: Language_voice = .jap_1
    @State private var selectedSpeed: Word_up = .s0_9
    
    var body: some View {
        List {
            Picker("Language", selection: $selectedLanguage) {
                Text("Japanese").tag(Language_option.Japanese)
                Text("English").tag(Language_option.English)
                Text("Taiwanese").tag(Language_option.Taiwanese)
            }
            Picker("Language", selection: $selectedVoice) {
                if selectedLanguage == .English {
                    Text("eng_1").tag(Language_voice.eng_1)
                    Text("eng_2").tag(Language_voice.eng_2)
                } else if selectedLanguage == .Japanese {
                    Text("jap_1").tag(Language_voice.jap_1)
                    Text("jap_2").tag(Language_voice.jap_2)
                } else {
                    Text("tw_1").tag(Language_voice.tw_1)
                }
                Text("Japanese").tag(Language_option.Japanese)
                Text("English").tag(Language_option.English)
                Text("Taiwanese").tag(Language_option.Taiwanese)
            }
            Picker("Speed", selection: $selectedSpeed) {
                Text("0.9").tag(Word_up.s0_9)
                Text("1.0").tag(Word_up.s1_0)
                Text("1.2").tag(Word_up.s1_2)
                Text("1.5").tag(Word_up.s1_5)
                Text("2.0").tag(Word_up.s2_0)
            }
        }
    }
}

struct Language_Change_List_UI_Previews: PreviewProvider {
    static var previews: some View {
        Language_Change_List_UI()
    }
}

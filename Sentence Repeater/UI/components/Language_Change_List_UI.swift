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
    
    enum Word_up: Float, CaseIterable, Identifiable {
        case 0.9, 1.0, 1.2, 1.5, 2.0
        var id: Self { self }
    }
    
    @State private var selectedSpeed: Word_up = .Japanese
    @State private var selectedLanguage: Language_option = .Japanese
    
    var body: some View {
        List {
            Picker("Language", selection: $selectedLanguage) {
                Text("Japanese").tag(Language_option.Japanese)
                Text("English").tag(Language_option.English)
                Text("Taiwanese").tag(Language_option.Taiwanese)
            }
            Spacer()
            Picker("Speed", selection: $selectedFlavor) {
                Text("Japanese").tag(Language_option.Japanese)
                Text("English").tag(Language_option.English)
                Text("Taiwanese").tag(Language_option.Taiwanese)
            }
        }
    }
}

struct Language_Change_List_UI_Previews: PreviewProvider {
    static var previews: some View {
        Language_Change_List_UI()
    }
}

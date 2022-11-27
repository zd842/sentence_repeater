//
//  fetch_voice_from_polly_workflow.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import Foundation
import MicrosoftCognitiveServicesSpeech

class Fetch_Voice_from_Azure: ObservableObject {
    var sub: String = "23d9d42eccc94130b2e666168e8215b5"
    var region: String = "eastus"
    @Published var times: Int = 0
    @Published var input_text: String = ""
    
    func synthesisToSpeaker(times: Int, input_text: String) {
        var speechConfig: SPXSpeechConfiguration?
        do {
            try speechConfig = SPXSpeechConfiguration(subscription: sub, region: region)
        } catch {
            print("error \(error) happened")
            speechConfig = nil
        }
        let synthesizer = try! SPXSpeechSynthesizer(speechConfig!)
        if input_text.isEmpty {
            return
        }

        for _ in 0...times {
            let result = try! synthesizer.speakText(input_text)
            if result.reason == SPXResultReason.canceled
            {
                let cancellationDetails = try! SPXSpeechSynthesisCancellationDetails(fromCanceledSynthesisResult: result)
                print("cancelled, detail: \(cancellationDetails.errorDetails!) ")
            }
        }

    }

}

//
//  fetch_voice_from_polly_workflow.swift
//  Sentence Repeater
//
//  Created by macos on 27/11/2022.
//

import Foundation
import MicrosoftCognitiveServicesSpeech

class Fetch_Voice_from_Azure {
    var sub: String = "23d9d42eccc94130b2e666168e8215b5"
    var region: String = "eastus"
    
    var inputText: String = "here so good."
    func synthesisToSpeaker(times: Int) {
        var speechConfig: SPXSpeechConfiguration?
        do {
            try speechConfig = SPXSpeechConfiguration(subscription: sub, region: region)
        } catch {
            print("error \(error) happened")
            speechConfig = nil
        }
        let synthesizer = try! SPXSpeechSynthesizer(speechConfig!)
        if inputText.isEmpty {
            return
        }
//        var fetched_result = try! synthesizer.getVoices()
//        print(type(of: fetched_result))
//        var fetched_voices = fetched_result.properties
//        print(fetched_voices)
//        print(type(of: fetched_voices))
        for _ in 0...times {
            let result = try! synthesizer.speakText(inputText)
            if result.reason == SPXResultReason.canceled
            {
                let cancellationDetails = try! SPXSpeechSynthesisCancellationDetails(fromCanceledSynthesisResult: result)
                print("cancelled, detail: \(cancellationDetails.errorDetails!) ")
            }
        }

    }

}

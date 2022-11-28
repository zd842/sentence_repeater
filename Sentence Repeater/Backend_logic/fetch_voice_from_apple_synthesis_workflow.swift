//
//  fetch_voice_from_apple_synthesis_workflow.swift
//  Sentence Repeater
//
//  Created by macos on 28/11/2022.
//


import Foundation
import MicrosoftCognitiveServicesSpeech
import AVFoundation

class Fetch_Voice_from_Azure: ObservableObject {
    
    var sub: String
    var region: String
    var synthesizer: SPXSpeechSynthesizer
//    var language_option: String
    
    @Published var times: Int
    @Published var input_text: String
    
    init(sub: String = "23d9d42eccc94130b2e666168e8215b5",
         region: String = "eastus",
         synthesizer: SPXSpeechSynthesizer = SPXSpeechSynthesizer(),
         times: Int = 0,
         input_text: String = "fourth and forward"
//         language_option: String = ""
    ) {
        self.sub = sub
        self.region = region
        self.times = times
        self.input_text = input_text
        self.synthesizer = synthesizer
        self.initSynthesis()
    }

    
    func increseTimes(step: Int) {
        times += step
    }
    
    func resetTimes() {
        times = 0
    }
    
    func initSynthesis() {
        var speechConfig: SPXSpeechConfiguration?
        do {
            try speechConfig = SPXSpeechConfiguration(subscription: sub, region: region)
            
        } catch {
            print("error \(error) happened")
            speechConfig = nil
        }
//        self.synthesizer = try! SPXSpeechSynthesizer(speechConfig!)
        self.synthesizer = try! SPXSpeechSynthesizer(speechConfiguration: speechConfig!, autoDetectSourceLanguageConfiguration: SPXAutoDetectSourceLanguageConfiguration(["English", "Japanese", "Chinese"]))
    }
    
    func synthesisToSpeaker(times: Int, input_text: String) {
        if input_text.isEmpty {
            return
        }
        
        if times != 0 {
            for tt in 0...(times - 1) {
                print(tt)
                if (times != 0) {
                    let result = try! self.synthesizer.speakText(input_text)
                    if result.reason == SPXResultReason.canceled
                    {
                        let cancellationDetails = try! SPXSpeechSynthesisCancellationDetails(fromCanceledSynthesisResult: result)
                        print("cancelled, detail: \(cancellationDetails.errorDetails!) ")
                    }
                }
            }
        }
        
    }
    
    func stopStythesis() {
        print(self.times)
        try! self.synthesizer.stopSpeaking()
        self.times = 0
    }

}

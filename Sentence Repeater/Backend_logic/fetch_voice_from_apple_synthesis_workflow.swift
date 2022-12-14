//
//  fetch_voice_from_apple_synthesis_workflow.swift
//  Sentence Repeater
//
//  Created by macos on 28/11/2022.
//


import Foundation
import MicrosoftCognitiveServicesSpeech
import AVFoundation

class Fetch_voice_from_apply_synth: ObservableObject {
    var utterance = AVSpeechUtterance()
    var voice = AVSpeechSynthesisVoice(language: "ja")
    var voice_in_queue = [AVSpeechUtterance]()
    let synthesizer = AVSpeechSynthesizer()
    
    let repeat_value: Int = 200
    var language: String = "en-US"
    var rate: Float = 0.5
    var pitch: Float = 1.0
    
    
    @Published var times: Int = 0
    @Published var input_text: String

    init() {
        self.input_text = "input a sentence on the right-hand side please."
        self.utterance = AVSpeechUtterance(string: self.input_text)
        self.change_pitch()
        self.change_postDelay()
        self.change_initialVolume()
        self.utterance.voice = voice
    }
    

    func change_rate(rate: Int = 2){
        if rate == 1 {
            self.rate =  0.5
        } else if rate == 2 {
            self.rate =  0.7
        } else {
            self.rate =  0.3
        }
    }
    
    func change_pitch(pitch: Float = 1.0) {
        self.pitch = pitch
    }
    
    func change_postDelay(postDelay: Double = 0.0) {
        self.utterance.postUtteranceDelay = postDelay
    }

    func change_initialVolume(initialVoice: Float = 0.9) {
        self.utterance.volume = initialVoice
    }
    
    func change_detectedLanguage(detevtedLan: Int = 1) {
        if detevtedLan == 0 {
            self.language =  "ja"
        } else if detevtedLan == 1 {
            self.language = "en-US"
        } else if detevtedLan == 2 {
            self.language = "en-GB"
        } else {
            self.language = "zh-TW"
        }
    }
    
    func synthesisToSpeaker(times: Int, input_text: String) {
        if times != 0 {
            for _ in 0...(times - 1) {
                let urr = AVSpeechUtterance(string: input_text)
                let vaa = AVSpeechSynthesisVoice(language: self.language)
                urr.voice = vaa
                urr.rate = self.rate
                urr.pitchMultiplier = self.pitch
                self.voice_in_queue.append(urr)
            }
            for ur in self.voice_in_queue {
//                print(ur.voice?.language)
//                print(ur.voice?.name)
//                print(ur.rate)
//                print(ur.pitchMultiplier)
                self.synthesizer.speak(ur)
            }
        }
        voice_in_queue.removeAll()

    }

    func resetTimes(){
        self.times = 0
    }
    
    func increseTimes(step: Int) {
        self.times += step
    }
    
    func stopStythesis() {
        self.synthesizer.stopSpeaking(at: .immediate)
    }

}

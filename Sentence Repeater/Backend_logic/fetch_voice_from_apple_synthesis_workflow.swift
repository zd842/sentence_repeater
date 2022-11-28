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
    
    
    @Published var times: Int = 0
    @Published var input_text: String

    init() {
        self.input_text = "this' a long sentence"
        self.utterance = AVSpeechUtterance(string: self.input_text)
        self.change_pitch()
        self.change_postDelay()
        self.change_initialVolume()
        self.utterance.voice = voice
    }
    

    func change_rate(rate: Int = 1) {
        if rate == 1 {
            self.utterance.rate = 0.5
        } else if rate == 2 {
            self.utterance.rate = 0.9
        } else {
            self.utterance.rate = 0.3
        }
        print(self.utterance.rate)
    }
    
    func change_pitch(pitch: Float = 0.9) {
        self.utterance.pitchMultiplier = pitch
    }
    
    func change_postDelay(postDelay: Double = 0.0) {
        self.utterance.postUtteranceDelay = postDelay
    }

    func change_initialVolume(initialVoice: Float = 0.9) {
        self.utterance.volume = initialVoice
    }
    
    func change_detectedLanguage(detevtedLan: Int) {
        if detevtedLan == 0 {
            self.utterance.voice = AVSpeechSynthesisVoice(language: "ja")
        } else if detevtedLan == 1 {
            self.utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        } else if detevtedLan == 2 {
            self.utterance.voice = AVSpeechSynthesisVoice(language: "en-UA")
        } else {
            self.utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        }
        print(self.utterance.voice?.language)
        print(self.utterance.voice?.identifier)
        print(self.utterance.voice?.name)
    }
    
    func synthesisToSpeaker(times: Int, input_text: String) {
        if times != 0 {
            for _ in 0...(times - 1) {
                var urr = AVSpeechUtterance(string: input_text)
                var vaa = AVSpeechSynthesisVoice(language: "ja")
                self.voice_in_queue.append(AVSpeechUtterance(string: input_text))
            }
            for ur in self.voice_in_queue {
                print(ur.voice?.language)
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

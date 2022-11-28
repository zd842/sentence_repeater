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
    // Create an utterance.
    var utterance = AVSpeechUtterance()
    // Retrieve the British English voice.
    var voice = AVSpeechSynthesisVoice(language: "en-GB")
    // Create a speech synthesizer.
    var voice_in_queue = [AVSpeechUtterance]()
    let synthesizer = AVSpeechSynthesizer()
    
    let repeat_value: Int = 200
    
    
    @Published var times: Int = 0
    @Published var input_text: String

    init() {
        self.input_text = "apple synth"
        self.utterance = AVSpeechUtterance(string: self.input_text)
        self.change_pitch()
        self.change_postDelay()
        self.change_initialVolume()
        
//        utterance.rate = 0.9
        
        // Assign the voice to the utterance.
        utterance.voice = voice
    }
    // Configure the utterance.
//    utterance.rate = 0.9
//    utterance.pitchMultiplier = 0.8
//    utterance.postUtteranceDelay = 0.2
//    utterance.volume = 0.8
    

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
    
    func change_detectedLanguage(detevtedLan: String) {
        self.voice = AVSpeechSynthesisVoice(language: detevtedLan)
    }
    
    func synthesisToSpeaker(times: Int, input_text: String) {
        if times != 0 {
            for _ in 0...(times - 1) {
                self.voice_in_queue.append(AVSpeechUtterance(string: input_text))
            }
            print(voice_in_queue.count)
            for ur in self.voice_in_queue {
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

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
    var utterance = AVSpeechUtterance(string: "The quick brown fox jumped over the lazy dog.")
    // Retrieve the British English voice.
    var voice = AVSpeechSynthesisVoice(language: "en-GB")
    // Create a speech synthesizer.
    let synthesizer = AVSpeechSynthesizer()

    
    init() {
        self.change_rate()
        self.change_pitch()
        self.change_postDelay()
        self.change_initialVolume()
        
        // Assign the voice to the utterance.
        utterance.voice = voice
    }
    // Configure the utterance.
//    utterance.rate= 0.57
//    utterance.pitchMultiplier = 0.8
//    utterance.postUtteranceDelay = 0.2
//    utterance.volume = 0.8
    

    func change_rate(rate: Float = 0.57) {
        self.utterance.rate = rate
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
    
    func synthSpeak() {
        self.synthesizer.speak(self.utterance)
    }


}
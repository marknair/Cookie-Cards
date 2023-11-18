//
//  PlaySound.swift
//  Cookie Cards
//
//  Created by Mark Nair on 11/18/23.
//

import Foundation
import AVFoundation
var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("There's no audio file.")
        }
    }

}

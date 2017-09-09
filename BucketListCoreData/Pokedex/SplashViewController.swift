//
//  splashViewController.swift
//  Pokedex
//
//  Created by Daniel Ra on 7/22/16.
//  Copyright © 2016 Daniel Ra. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SplashViewController: UIViewController {
    var player: AVAudioPlayer?
    func stopSound() {
        let url = Bundle.main.url(forResource: "testsound", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.stop()
        } catch let error as NSError {
            print(error.description)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        func playSound() {
            let url = Bundle.main.url(forResource: "testsound", withExtension: "mp3")!
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
        }
        playSound()
    }
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        stopSound()
    }
}

//
//  ViewController.swift
//  Mar23_AudioStuff
//
//  Created by Consultant on 3/23/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var HorrorButton: UIButton!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func horrorButtonTapped(_ sender: Any) {
        if let player = player, player.isPlaying {
            player.stop()
            HorrorButton.setTitle("PLAY", for: .normal)
        } else {
            HorrorButton.setTitle("STOP", for: .normal)
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                let urlString = Bundle.main.path(forResource: "vineboom_bass_boosted", ofType: "mp3")
                guard let urlString = urlString else { return }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                guard let player = player else { return }
                
                player.play()
            } catch {
                print("Error")
            }
        }
    }
}


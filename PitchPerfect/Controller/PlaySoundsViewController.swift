//
//  PlayBackViewController.swift
//  PitchPerfect
//
//  Created by Moaz on 23/08/2026.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
   
    @IBOutlet weak var stopPlaybackButton: UIButton!
    @IBOutlet weak var reverbAudioButton: UIButton!
    @IBOutlet weak var echoAudioButton: UIButton!
    @IBOutlet weak var highPitchAudioButton: UIButton!
    @IBOutlet weak var lowPitchAudioButton: UIButton!
    @IBOutlet weak var fastAudioButton: UIButton!
    @IBOutlet weak var slowAudioButton: UIButton!
    
    var recordedAudioURL:URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
        
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    
    @IBAction func playbackButtonPressed(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }

            configureUI(.playing)
    }
    
    @IBAction func stopPlaybackPressed(_ sender: Any) {
        stopAudio()
    }
}

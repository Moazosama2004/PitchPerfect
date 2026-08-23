//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Moaz on 22/08/2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func recordAudio(_ sender: UIButton) {
        print("Start Recording....")
        recordingLabel.text = "Recording...."
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        print("Stop Recording....")
        recordingLabel.text = "Stop Recording...."
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in 
            guard let self = self else {return}
            self.recordingLabel.text = "Tap To Record"
        }
        
    }
}


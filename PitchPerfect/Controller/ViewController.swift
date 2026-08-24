//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Moaz on 22/08/2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        stopRecordingButton.isEnabled = false
  }
    
    override func viewWillAppear(_ animated: Bool) {
  }


    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording...."
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        print("Stop Recording....")
        recordingLabel.text = "Stop Recording...."
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else {return}
            self.recordingLabel.text = "Tap To Record"
            self.recordButton.isEnabled = true;
            stopRecordingButton.isEnabled = false
        }
        
    }
}


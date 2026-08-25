//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Moaz on 22/08/2026.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController , AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
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
        
        // create path and where
        let dirPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true
        )[0]
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print("File Path : \(filePath!)")
        
        // create Session to specific whatyou want
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(
                .playAndRecord,
                mode: .default,
                options: .defaultToSpeaker
            )
        } catch {
            print("Can't set Category for Session" , error)
        }
        
        // init recoder
        do {
            guard let filePath else {return}
            audioRecorder = try AVAudioRecorder(url: filePath, settings: [:])
            audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        } catch {
            print("Failed to create recorder:", error)
        }
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        print("Stop Recording....")
        recordingLabel.text = "Stop Recording...."
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else {return}
            self.recordingLabel.text = "Tap To Record"
            self.recordButton.isEnabled = true;
            stopRecordingButton.isEnabled = false
            audioRecorder.stop()
            let session = AVAudioSession.sharedInstance()
            do {
                try session.setActive(false)
            } catch {
                print("session stoping error : \(error)")
            }
        }
        
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not successfully")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlayBackViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}


//
//  ViewController.swift
//  spequal
//
//  Created by Lauren Caponong on 4/8/16.
//  Copyright © 2016 Lauren Caponong. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController,  AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    var soundRecorder: AVAudioRecorder!
    var soundPlayer: AVAudioPlayer!
    let fileName = "demo.caf"

    func getCacheDirectory() -> String {
    
        let paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true) as [String]
        
        return paths[0]
    }
    
    func getFileURL() -> NSURL {
        let path = getCacheDirectory().stringByAppendingString(fileName)
        let filePath = NSURL(fileURLWithPath: path)
        return filePath
    }
    
    func setupRecorder() {
        var recordSettings : [String : Any] = [
            AVFormatIDKey: kAudioFormatAppleLossless,
            AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey : 44100.0
        ]
        
        var error: NSError?

        do
        {
            soundRecorder = try AVAudioRecorder(URL:getFileURL(), settings:[:])
        }
        catch let error as NSError
        {
            print(error.description)
        }
        
        
        if let err = error {
            print(error?.localizedDescription)
        } else {
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
        }
    }
    
    

    func preparePlayer() {
        var error: NSError?
        
        soundPlayer = AVAudioPlayer(contentsOfURL: getFileURL(), error: &error)
        
        if let err = error {
            print("Error: \(err.localizedDescription)")
        } else {
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
        }
    }
    
    
    
    /////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func playButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func recordButtonTapped(sender: AnyObject) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


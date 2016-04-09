//
//  SQMainViewController.swift
//  spequal
//
//  Created by Charles Kang on 4/8/16.
//  Copyright © 2016 Lauren Caponong. All rights reserved.
//

import UIKit
import Beethoven
import Pitchy

class SQMainViewController: UIViewController, PitchEngineDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pitchEngineDidRecievePitch(pitchEngine: PitchEngine, pitch: Pitch) {
        //    noteLabel.text = pitch.note.string
        noteLabel.text = String(pitch.frequency)
        
        let offsetPercentage = pitch.closestOffset.percentage
        let absOffsetPercentage = abs(offsetPercentage)
        
        guard absOffsetPercentage > 1.0 else {
            return
        }
        
        let prefix = offsetPercentage > 0 ? "+" : "-"
        
        offsetLabel.text = "\(prefix)" + String(format:"%.2f", absOffsetPercentage) + "%"
        offsetLabel.textColor = color
        offsetLabel.hidden = false
    }
    
    func pitchEngineDidRecieveError(pitchEngine: PitchEngine, error: ErrorType) {
        print(error)
    }
}

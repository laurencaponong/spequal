//
//  SQPitchDetection.swift
//  spequal
//
//  Created by Charles Kang on 4/8/16.
//  Copyright © 2016 Lauren Caponong. All rights reserved.
//

import UIKit
import Pitchy


class SQPitchDetection: NSObject {
    
    func trackMalePitch() {
        
        do {
            Config.minimumFrequency = 85.0
            Config.maximumFrequency = 180.0
            
            // Frequency = 445 Hz
            let pitch = try Pitch(frequency: 445.0)
            let pitchOffsets = pitch.offsets
            
            print(pitchOffsets.lower.frequency)     // 5 Hz
            print(pitchOffsets.lower.percentage)    // 19.1%
            print(pitchOffsets.lower.note.index)    // 0
            print(pitchOffsets.lower.cents)         // 19.56
            
            print(pitchOffsets.higher.frequency)    // -21.164 Hz
            print(pitchOffsets.higher.percentage)   // -80.9%
            print(pitchOffsets.higher.note.index)   // 1
            print(pitchOffsets.higher.cents)        // -80.4338
            
            print(pitchOffsets.closest.note.string) // "A4"
            
            // You could also use acoustic wave
            print(pitch.wave.wavelength)            // 0.7795 meters
        } catch {
            // Handle errors
        }
        
    }
}

func trackFemalePitch() {
    
    do {
        Config.minimumFrequency = 165.0
        Config.maximumFrequency = 255.0
        
        // Frequency = 445 Hz
        let pitch = try Pitch(frequency: 445.0)
        let pitchOffsets = pitch.offsets
        
        print(pitchOffsets.lower.frequency)     // 5 Hz
        print(pitchOffsets.lower.percentage)    // 19.1%
        print(pitchOffsets.lower.note.index)    // 0
        print(pitchOffsets.lower.cents)         // 19.56
        
        print(pitchOffsets.higher.frequency)    // -21.164 Hz
        print(pitchOffsets.higher.percentage)   // -80.9%
        print(pitchOffsets.higher.note.index)   // 1
        print(pitchOffsets.higher.cents)        // -80.4338
        
        print(pitchOffsets.closest.note.string) // "A4"
        
        // You could also use acoustic wave
        print(pitch.wave.wavelength)            // 0.7795 meters
    } catch {
        // Handle errors
    }
    
}

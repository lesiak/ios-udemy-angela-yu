//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":  5, "Medium": 7, "Hard": 12]
    
    var secondsRemaining = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let cookingTimeInSeconds = eggTimes[hardness]! * 60
        secondsRemaining = cookingTimeInSeconds
        print("Clicked \(secondsRemaining)")
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in self.updateTimer() }
        
    }
    
    func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }
    }
}

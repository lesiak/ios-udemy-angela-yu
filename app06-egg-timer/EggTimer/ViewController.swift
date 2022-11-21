//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":  5, "Medium": 7, "Hard": 12]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        let cookingTimeInSeconds = eggTimes[hardness]! * 1
        totalTime = cookingTimeInSeconds
        secondsPassed = 0
        progressBar.progress = 0.0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in self.updateTimer() }
        
    }
    
    func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        if secondsPassed == totalTime {
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "Done"
        }
    }
}

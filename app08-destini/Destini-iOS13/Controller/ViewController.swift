//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let stories = [Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
                   Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
                   Story(title: "You find a treasure chest.", choice1: "Open it.", choice2: "Check for traps.")
    ]
    
    var stepNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let currentStep = stories[stepNumber]
        if (sender.currentTitle == currentStep.choice1) {
            stepNumber = 2 * stepNumber + 1
        } else {
            stepNumber = 2 * stepNumber + 2
        }
        if (stepNumber >= stories.count) {
            stepNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        let currentStep = stories[stepNumber]
        storyLabel.text = currentStep.title
        choice1Button.setTitle(currentStep.choice1, for: .normal)
        choice2Button.setTitle(currentStep.choice2, for: .normal)
    }
}


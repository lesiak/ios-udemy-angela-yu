//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayCurrentQuestion()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let isCorrect = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.moveToNextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {
            _ in self.displayCurrentQuestion()
        }
    }
    
    func displayCurrentQuestion() {
        questionLabel.text = quizBrain.getCurrentQuestion().text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
}


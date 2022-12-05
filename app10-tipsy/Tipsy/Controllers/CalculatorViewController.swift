//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float = 0.1
    var nPeople: Int = 2
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = sender == zeroPctButton
        tenPctButton.isSelected = sender == tenPctButton
        twentyPctButton.isSelected = sender == twentyPctButton
        if sender == zeroPctButton {
            tip = 0.0
        } else if sender == tenPctButton {
            tip = 0.1
        } else {
            tip = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        nPeople = Int(sender.value)
        splitNumberLabel.text = String(nPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        let bill = Float(billTextField.text ?? "0") ?? 0.0
        let totalPerPerson = (1 + tip) * bill / Float(nPeople)
        print(totalPerPerson)
    }
}


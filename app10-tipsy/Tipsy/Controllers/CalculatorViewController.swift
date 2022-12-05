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
    var totalPerPerson: Float = 0.0
    
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
        totalPerPerson = (1 + tip) * bill / Float(nPeople)
        performSegue(withIdentifier: "showResultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue" {
            let resultsController = segue.destination as! ResultsViewController
            resultsController.tip = tip
            resultsController.nPeople = nPeople
            resultsController.totalPerPerson = totalPerPerson
        }
    }
}


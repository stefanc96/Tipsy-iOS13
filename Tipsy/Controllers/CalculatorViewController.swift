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
    
    var splitNumber: Int!
    var tipValue: Double!
    var splitValue: Double!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.titleLabel?.text {
        case "0%":
            tipValue = 0.0
            zeroPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            break
        case "10%":
            tipValue=0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            break
        default:
            tipValue=0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            break
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billValue = Double(billTextField.text!)
        let splitNumber = Double(splitNumberLabel.text!)
        
        splitValue = (billValue! + (billValue! * tipValue!)) / splitNumber!
        performSegue(withIdentifier: "goToResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResults"){
            let resultsVC = segue.destination as! ResultsViewController
            
            resultsVC.totalNumber = String(format: "%.2f", splitValue!)
            resultsVC.splitNumber = Int(splitNumberLabel.text!)
            resultsVC.splitPercentage = String(format: "%.0f", tipValue * 100) + "%"
        }
    }

}


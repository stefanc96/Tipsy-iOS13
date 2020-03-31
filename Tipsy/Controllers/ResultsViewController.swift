//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Stefan on 31/03/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalNumber: String!
    var splitNumber: Int!
    var splitPercentage: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalNumber!
        settingsLabel.text = "Split between \(String(splitNumber)) people, with \(splitPercentage!) tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

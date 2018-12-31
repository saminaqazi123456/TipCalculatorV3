//
//  ViewController.swift
//  tipCalculator
//
//  Created by Samina Qazi on 12/28/18.
//  Copyright © 2018 Samina Qazi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var eachPersonLabel: UILabel!
    @IBOutlet weak var personsUIStepper: UIStepper!
    
    var total: Double = 0
    var eachPerson: Double = 0
    
    @IBAction func personsStepper(_ sender: UIStepper) {
        //personsLabel.text = String(Int(sender.value))
        personsLabel.text = Int(sender.value).description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipIndex")
        personsUIStepper.value = defaults.double(forKey: "personsUIStepper")
        personsLabel.text = Int(personsUIStepper.value).description
        calculateTip(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the title in the Navigation Bar
        self.title = "My Tip Calculator"
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        eachPerson = total / (personsUIStepper.value)
        
        //tipLabel.text = "$\(tip)"
        //totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        eachPersonLabel.text = String(format: "$%.2f", eachPerson)
        
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipIndex")
        defaults.set(personsUIStepper.value, forKey: "personsUIStepper")
        defaults.synchronize()
        
    }
    
}


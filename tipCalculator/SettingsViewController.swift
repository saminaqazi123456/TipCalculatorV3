//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Samina Qazi on 12/28/18.
//  Copyright © 2018 Samina Qazi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var personsUIStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "My Settings"
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipIndex")
        defaults.set(personsUIStepper.value, forKey: "personsUIStepper")
        defaults.synchronize()
        
        
    }
    
    
    @IBAction func personsStepper(_ sender: UIStepper) {
        personsLabel.text = Int(sender.value).description
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     @IBOutlet weak var tipLabel: UILabel!
     @IBOutlet weak var totalLabel: UILabel!
     @IBOutlet weak var billField: UITextField!
     @IBOutlet weak var tipControl: UISegmentedControl!
     @IBOutlet weak var personsLabel: UILabel!
     @IBOutlet weak var eachPersonLabel: UILabel!
     @IBOutlet weak var personsUIStepper: UIStepper!
     
     
     */

    
    
    
}

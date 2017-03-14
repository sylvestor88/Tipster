//
//  ViewController.swift
//  Tipster
//
//  Created by Sylvestor George on 3/12/17.
//  Copyright © 2017 Sylvestor George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var sliderTipPercentage: UISlider!
    @IBOutlet weak var currentSliderVal: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        sliderTipPercentage.value = Float(defaults.integer(forKey: "defaultTip"))
        sliderTipPercentage.minimumValue = Float(defaults.integer(forKey: "defaultMinTip"))
        sliderTipPercentage.maximumValue = Float(defaults.integer(forKey: "defaultMaxTip"))
        currentSliderVal.text = String(Int(sliderTipPercentage.value))
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let currentPercentage = Int(sliderTipPercentage.value)
        currentSliderVal.text = String(Int(sliderTipPercentage.value))

        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(currentPercentage) / 100
        let total = bill + tip
        
        tipValueLabel.text = String(format: "$%.2f", tip)
        totalBillLabel.text = String(format: "$%.2f", total)
    }
}


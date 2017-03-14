//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Sylvestor George on 3/13/17.
//  Copyright © 2017 Sylvestor George. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentage: UILabel!
    @IBOutlet weak var defaultTipSlider: UISlider!
    @IBOutlet weak var defaultMinTipPercentage: UILabel!
    @IBOutlet weak var defaultMinTipSlider: UISlider!
    @IBOutlet weak var defaultMaxTipPercentage: UILabel!
    @IBOutlet weak var defaultMaxTipSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        defaultTipSlider.value = Float(defaults.integer(forKey: "defaultTip"))
        defaultTipPercentage.text = String(Int(defaultTipSlider.value))
        
        defaultMinTipSlider.value = Float(defaults.integer(forKey: "defaultMinTip"))
        defaultMinTipPercentage.text = String(Int(defaultMinTipSlider.value))
        
        defaultMaxTipSlider.value = Float(defaults.integer(forKey: "defaultMaxTip"))
        defaultMaxTipPercentage.text = String(Int(defaultMaxTipSlider.value))
    }
    
    @IBAction func changeDefaultTip(_ sender: AnyObject) {
        
        let defaultTip = Int(defaultTipSlider.value)
        let defaultMinTip = Int(defaultMinTipSlider.value)
        let defaultMaxTip = Int(defaultMaxTipSlider.value)
        
        defaultTipPercentage.text = String(defaultTip)
        defaultMinTipPercentage.text = String(defaultMinTip)
        defaultMaxTipPercentage.text = String(defaultMaxTip)
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTip, forKey: "defaultTip")
        defaults.set(defaultMinTip, forKey: "defaultMinTip")
        defaults.set(defaultMaxTip, forKey: "defaultMaxTip")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

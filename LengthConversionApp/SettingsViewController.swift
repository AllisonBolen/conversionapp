//
//  settingsViewContoller.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/22/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func indicateSelsction(vice_1: String, vice_2: String)
}

class SettingsViewController: UIViewController {
    
    var pickerData: [String] = [String]()
    var selection:String
    var to_selection:String
    var from_selection:String
    var delegate : SettingsViewControllerDelegate?
    
    @IBOutlet weak var unitsFromOut: UITextField!
    @IBAction func unitsFrom(_ sender: UITextField) {
    
    }
    
    @IBOutlet weak var unitsToOut: UITextField!
    @IBAction func UnitsTo(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentMode.rawValue == "Length"{
            self.pickerData = ["Yards", "Meters", "Miles"]
            self.selection = "Yards"
        }
        else{
            self.pickerData = ["Liters", "Gallons","Quarts"]
            self.selection = "Liters"
        }
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate{
            d.indicateSelsction(vice_1: from_selection, vice_2: to_selection)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var picker: UIPickerView!
    
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.selection = self.pickerData[row]
    }
}








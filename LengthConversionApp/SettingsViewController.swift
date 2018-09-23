//
//  settingsViewContoller.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/22/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func indicateSelsction(vice: String)
}

class SettingsViewController: UIViewController {
    
    var pickerData: [String] = [String]()
    var selection:String = "Yards"
    var delegate : SettingsViewControllerDelegate?
    
    @IBOutlet weak var unitsFromOut: UITextField!
    @IBAction func unitsFrom(_ sender: UITextField) {
    
    }
    
    @IBOutlet weak var unitsToOut: UITextField!
    @IBAction func UnitsTo(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerData = ["Yards", "Meters", "Miles"]
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate{
            d.indicateSelsction(vice: selection)
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








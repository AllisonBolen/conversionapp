//
//  settingsViewContoller.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/22/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func indicateSelection(vice_1: String, vice_2: String)
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    var pickerData: [String] = [String]()
    var selection:String = ""
    var to_selection:String = ""
    var from_selection:String = ""
    var delegate : SettingsViewControllerDelegate? = nil
    var currentMode = CalculatorMode.Length
    var select = true
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    // send back the selected values to the main page
    @IBAction func saveButton(_ sender: Any) {
        if let d = self.delegate{
            d.indicateSelection(vice_1: from_selection, vice_2: to_selection)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fromLabel.text = from_selection
        self.toLabel.text = to_selection
        // set up picker values
        if self.currentMode.rawValue == "Length"{
            self.pickerData = ["Yards", "Meters", "Miles"]
            self.selection = "Yards"
        }
        else{
            self.pickerData = ["Liters", "Gallons","Quarts"]
            self.selection = "Liters"
        }
        // set up picker values
        self.picker.delegate = self
        self.picker.dataSource = self
        // set up touch on labels and view
        let detectFromLabel = UITapGestureRecognizer(target: self, action: #selector(showFromPicker))
        let detectToLabel = UITapGestureRecognizer(target: self, action: #selector(showToPicker))
        let detectTouchView = UITapGestureRecognizer(target: self, action: #selector(hidePicker))
        // set up the labels and views with the gestures
        self.fromLabel.addGestureRecognizer(detectFromLabel)
        self.toLabel.addGestureRecognizer(detectToLabel)
        self.view.addGestureRecognizer(detectTouchView)
    }
    // show the picker
    @objc func showFromPicker(){
        self.picker.isHidden = false
        select = true
    }
    // show the picker
    @objc func showToPicker(){
        self.picker.isHidden = false
        select = false
    }
    // hide the picker
    @objc func hidePicker(){
        self.picker.isHidden = true
        if(select){
            self.fromLabel.text = self.selection
            self.from_selection = self.selection
        }else{
            self.toLabel.text = self.selection
            self.to_selection = selection
        }
        self.picker.reloadAllComponents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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








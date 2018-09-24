//
//  ViewController.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/17/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate{
    func indicateSettingsMode(FromLabel: String, ToLabel: String, currentMode: CalculatorMode)
}
class ViewController: UIViewController, SettingsViewControllerDelegate {
        
    @IBOutlet weak var ToLabel: UILabel!
    @IBOutlet weak var FromLabel: UILabel!

    @IBOutlet weak var FromTextBox: UITextField!
    
    @IBOutlet weak var ToTextBox: UITextField!
    var currentMode = CalculatorMode.Length
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ToTextBox.keyboardType = UIKeyboardType.decimalPad
        self.FromTextBox.keyboardType = UIKeyboardType.decimalPad

        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
 }
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    @IBAction func clickMeters(_ sender: Any) {
        FromTextBox.text = ""
       // meters.text = ""
    }
    
    @IBAction func clickYards(_ sender: Any) {
       // yards.text = ""
        ToTextBox.text = ""
    }
    
    @IBAction func mode(_ sender: UIButton) {
        // modes = convert to volume
        if (self.currentMode.rawValue == "Length"){
            self.titleLabel.text = "Volume Conversion"
            self.FromLabel.text = "Gallons"
            self.ToLabel.text = "Liters"
            self.FromTextBox.placeholder = "Enter Volume in  \(FromLabel.text!)"
            self.ToTextBox.placeholder = "Enter Volume in \(ToLabel.text!)"
            self.currentMode = CalculatorMode.Volume
        }else{
            self.titleLabel.text = "Length Conversion"
            self.FromLabel.text = "Yards"
            self.ToLabel.text = "Meters"
            self.FromTextBox.placeholder = "Enter Length in \(FromLabel.text!)"
            self.ToTextBox.placeholder = "Enter Length in \(ToLabel.text!)"
            self.currentMode = CalculatorMode.Length
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metersLable: UILabel!
    @IBOutlet weak var yardsLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clear(_ sender: UIButton) {
        ToTextBox.text = ""
        FromTextBox.text = ""
        dismissKeyboard()
        FromTextBox.resignFirstResponder()
        ToTextBox.resignFirstResponder()
    }
    
    @IBAction func Calculate(_ sender: UIButton) {

        if let yd:Double = Double(self.FromTextBox.text!)  {
            FromTextBox.resignFirstResponder()
            dismissKeyboard()
            ToTextBox.text = String(format: "%f",yd*lengthConversionTable[LengthConversionKey(toUnits: .Meters, fromUnits: .Yards)]!)
            
        }
        else if let mt:Double = Double(self.ToTextBox.text!) {
            ToTextBox.resignFirstResponder()
            dismissKeyboard()
            FromTextBox.text = String(format: "%f", mt*lengthConversionTable[LengthConversionKey(toUnits: .Yards, fromUnits: .Meters)]!)
        }
    }
    
    func indicateSelection(vice_1: String, vice_2: String){
        self.FromLabel.text = vice_1
        self.ToLabel.text = vice_2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination.childViewControllers[0] as? SettingsViewController{
           dest.indicateSettingsMode(FromLabel: FromLabel.text!, ToLabel: ToLabel.text!, currentMode: currentMode)
            dest.delegate = self
        }
    }
}


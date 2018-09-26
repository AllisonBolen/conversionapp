//
//  ViewController.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/17/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit


class ViewController: UIViewController, SettingsViewControllerDelegate {
        
    @IBOutlet weak var FromLabel: UILabel!
    @IBOutlet weak var ToLabel: UILabel!
    

    @IBOutlet weak var FromTextBox: UITextField!
    
    @IBOutlet weak var ToTextBox: UITextField!
    var currentMode = CalculatorMode.Length
    var previousFromLabel: String = "Gallons"
    var previousToLabel: String = "Liters"
    
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
        let tempFrom:String = self.FromLabel.text!
        let tempTo:String = self.ToLabel.text!
        if (self.currentMode.rawValue == "Length"){
            self.titleLabel.text = "Volume Conversion"
            self.FromLabel.text = self.previousFromLabel
            self.ToLabel.text = self.previousToLabel
            self.previousFromLabel = tempFrom
            self.previousToLabel = tempTo
            self.FromTextBox.placeholder = "Enter Volume in \(FromLabel.text!)"
            self.ToTextBox.placeholder = "Enter Volume in \(ToLabel.text!)"
            self.currentMode = CalculatorMode.Volume
        }else{
            self.titleLabel.text = "Length Conversion"
            self.FromLabel.text = self.previousFromLabel
            self.ToLabel.text = self.previousToLabel
            self.previousFromLabel = tempFrom
            self.previousToLabel = tempTo
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
    @IBAction func exit(_ sender: Any) {
    }
    
    @IBAction func Calculate(_ sender: UIButton) {

        if let to:Double = Double(self.FromTextBox.text!)  {
            FromTextBox.resignFirstResponder()
            dismissKeyboard()
            ToTextBox.text = String(format: "%f",to*conversionFinder())
        }
        else if let from:Double = Double(self.ToTextBox.text!) {
            ToTextBox.resignFirstResponder()
            dismissKeyboard()
            FromTextBox.text = String(format: "%f", from/conversionFinder())
        }
    }
    
    func conversionFinder() -> Double{
        var conversion: Double!
        if currentMode.rawValue == "Length"{
            if FromLabel.text == "Meters" && ToLabel.text == "Yards"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Yards, fromUnits: .Meters)]!
            }else if FromLabel.text == "Meters" && ToLabel.text == "Meters"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Meters, fromUnits: .Meters)]!
            }else if FromLabel.text == "Meters" && ToLabel.text == "Miles"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Miles, fromUnits: .Meters)]!
            }else if FromLabel.text == "Yards" && ToLabel.text == "Meters"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Meters, fromUnits: .Yards)]!
            }else if FromLabel.text == "Yards" && ToLabel.text == "Yards"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Yards, fromUnits: .Yards)]!
            }else if FromLabel.text == "Yards" && ToLabel.text == "Miles"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Miles, fromUnits: .Yards)]!
            }else if FromLabel.text == "Miles" && ToLabel.text == "Miles"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Miles, fromUnits: .Miles)]!
            }else if FromLabel.text == "Miles" && ToLabel.text == "Meters"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Meters, fromUnits: .Miles)]!
            }else if FromLabel.text == "Miles" && ToLabel.text == "Yards"{
                conversion = lengthConversionTable[LengthConversionKey(toUnits: .Yards, fromUnits: .Miles)]!
            }
        }else{
            if FromLabel.text == "Gallons" && ToLabel.text == "Liters"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Liters, fromUnits: .Gallons)]!
            } else if FromLabel.text == "Gallons" && ToLabel.text == "Gallons"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Gallons, fromUnits: .Gallons)]!
            }else if FromLabel.text == "Gallons" && ToLabel.text == "Quarts"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Quarts, fromUnits: .Gallons)]!
            } else if FromLabel.text == "Liters" && ToLabel.text == "Gallons"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Gallons, fromUnits: .Liters)]!
            } else if FromLabel.text == "Liters" && ToLabel.text == "Liters"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Liters, fromUnits: .Liters)]!
            } else if FromLabel.text == "Liters" && ToLabel.text == "Quarts"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Quarts, fromUnits: .Liters)]!
            } else if FromLabel.text == "Quarts" && ToLabel.text == "Gallons"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Gallons, fromUnits: .Quarts)]!
            } else if FromLabel.text == "Quarts" && ToLabel.text == "Quarts"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Quarts, fromUnits: .Quarts)]!
            } else if FromLabel.text == "Quarts" && ToLabel.text == "Liters"{
                conversion = volumeConversionTable[VolumeConversionKey(toUnits: .Liters, fromUnits: .Quarts)]!
            }
        }
        return conversion
    }
    
    func indicateSelection(vice_1: String, vice_2: String){
        self.FromLabel.text = vice_1
        self.ToLabel.text = vice_2
        if (self.currentMode.rawValue == "Length"){
            self.FromTextBox.placeholder = "Enter Length in \(FromLabel.text!)"
            self.ToTextBox.placeholder = "Enter Length in \(ToLabel.text!)"
        }else{
            self.FromTextBox.placeholder = "Enter Volume in  \(FromLabel.text!)"
            self.ToTextBox.placeholder = "Enter Volume in \(ToLabel.text!)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination.childViewControllers[0] as? SettingsViewController{
            dest.to_selection = self.ToLabel.text!
            dest.from_selection = self.FromLabel.text!
            dest.currentMode = self.currentMode
            dest.delegate = self
        }
    }
}


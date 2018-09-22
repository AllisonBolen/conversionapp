//
//  ViewController.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/17/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yards: UITextField!
    @IBOutlet weak var meters: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.meters.keyboardType = UIKeyboardType.decimalPad
        self.yards.keyboardType = UIKeyboardType.decimalPad

        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
 }
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    @IBAction func clickMeters(_ sender: Any) {
        yards.text = ""
       // meters.text = ""
    }
    
    @IBAction func clickYards(_ sender: Any) {
       // yards.text = ""
        meters.text = ""
    }
    
    @IBAction func mode(_ sender: UIButton) {
        // modes = convert to volume
        if (self.titleLabel.text?.range(of: "Length") != nil){
            self.titleLabel.text = "Volume Conversion"
            self.metersLable.text = "Gallons"
            self.yardsLabel.text = "Liters"
        }else{
            self.titleLabel.text = "Length Conversion"
            self.metersLable.text = "Yards"
            self.yardsLabel.text = "Meters"
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
        meters.text = ""
        yards.text = ""
        dismissKeyboard()
        yards.resignFirstResponder()
        meters.resignFirstResponder()
    }
    
    @IBAction func Calculate(_ sender: UIButton) {
        if (self.titleLabel.text?.range(of: "Length") != nil){
            if let yd:Double = Double(self.yards.text!)  {
                yards.resignFirstResponder()
                dismissKeyboard()
                meters.text = String(format: "%f",yd/lengthConversionTable[LengthConversionKey(toUnits: .Yards, fromUnits: .Meters)]!)
                
            }else if let mt:Double = Double(self.meters.text!) {
                meters.resignFirstResponder()
                dismissKeyboard()
                yards.text = String(format: "%f", mt*lengthConversionTable[LengthConversionKey(toUnits: .Meters, fromUnits: .Yards)]!)
            }
        }
    }
}


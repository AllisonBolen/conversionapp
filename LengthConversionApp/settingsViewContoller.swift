//
//  settingsViewContoller.swift
//  LengthConversionApp
//
//  Created by Allison Bolen on 9/22/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

protocol settingsViewControllerDelegate{
    func indicateSelsction(vice: String)
}

class settingsViewContoller: UIViewController {
    
    var pickerData: [String] = [String]()
    var selection:String = "Yards"
    var delegate : settingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var picker: UIPickerView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension settingsViewContoller: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titelForRow row: Int, numberOfRowsInComponent component: Int ) -> String?{
        return self.pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, numberOfRowsInComponent component: Int){
        return self.selection = self.pickerData[row]
    }
}








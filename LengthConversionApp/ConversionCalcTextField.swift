//
//  ConversionCalcTextField.swift
//  LengthConversionApp
//
//  Created by Brendan Nahed on 10/2/18.
//  Copyright © 2018 Allison Bolen. All rights reserved.
//

import UIKit

class ConversionCalcTextField: UITextField {
    override func awakeFromNib() {
        self.tintColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        self.borderStyle = .roundedRect
        
        self.textColor = FOREGROUND_COLOR
        guard let ph = self.placeholder else{
            return
        }
        self.attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedStringKey.foregroundColor : FOREGROUND_COLOR])
    }
    
}

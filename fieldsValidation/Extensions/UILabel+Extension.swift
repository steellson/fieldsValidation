//
//  UILabel+Extension.swift
//

import UIKit


extension UILabel {
    
    convenience init(_ font: UIFont, _ color: UIColor, _ aligment: NSTextAlignment, _ text: String) {
        self.init()
        self.font          = font
        self.textColor     = color
        self.textAlignment = aligment
        self.text          = text
        numberOfLines      = 0
        
        squadShadow()
    }
}

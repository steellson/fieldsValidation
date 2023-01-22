//
//  UIButton+Extension.swift
//

import UIKit

extension UIButton {
    
    //MARK: - Convenience
    
    convenience init(_ title: String, _ titleColor: UIColor, _ bgColor: UIColor) {
        self.init()
    
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor     = bgColor

        squadShadow()
    }

}
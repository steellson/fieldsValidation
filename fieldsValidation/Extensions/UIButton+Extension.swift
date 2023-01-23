//
//  UIButton+Extension.swift
//

import UIKit

extension UIButton {
    
    //MARK: - Convenience
    
    convenience init(_ title: String, _ titleColor: UIColor, _ bgColor: UIColor, _ fontSize: CGFloat) {
        self.init()
    
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font    = UIFont(name: "Helvetica-Bold", size: fontSize)
        backgroundColor     = bgColor
        

        squadShadow()
    }

}

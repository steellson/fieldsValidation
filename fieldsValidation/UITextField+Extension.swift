//
//  UITextField+Extension.swift
//

import UIKit

extension UITextField {
    
    
//MARK: Convenience methods
    
    public func buildAuthField(with placeholder: String) -> UITextField {
        let field = UITextField()
        field.placeholder     = placeholder
        field.backgroundColor = .gray
        //field.tintColor           = .white
        field.textColor       = .white
        
        let spacer            = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: field.frame.height))
        field.leftView        = spacer
        field.leftViewMode    = .always
        
        squadShadow()
        return field
    }
    
}

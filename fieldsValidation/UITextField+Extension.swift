//
//  UITextField+Extension.swift
//

import UIKit

extension UITextField {
    
    
//MARK: Convenience methods
    
    public func buildAuthField(with placeholder: String) -> UITextField {
        let field             = UITextField()
        let spacer            = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: field.frame.height))
        field.placeholder     = placeholder
        field.backgroundColor = .gray
        field.textColor       = .white
        field.leftView        = spacer
        field.leftViewMode    = .always
        
        squadShadow()
        return field
    }
    
}

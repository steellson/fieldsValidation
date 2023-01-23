//
//  UITextField+Extension.swift
//

import UIKit

extension UITextField {
    
    
//MARK: Convenience methods
    
    public func buildAuthField(with placeholder: String) -> UITextField {
        let field                   = UITextField()
        let spacer                  = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: field.frame.height))
        field.placeholder           = placeholder
        field.backgroundColor       = #colorLiteral(red: 0.7314928174, green: 0.5001189709, blue: 0.5559496284, alpha: 1)
        field.textColor             = .white
        field.layer.borderWidth     = 2
        field.layer.backgroundColor = #colorLiteral(red: 0.5298599601, green: 0.5298599601, blue: 0.5298599601, alpha: 1)
        field.leftView              = spacer
        field.leftViewMode          = .always
        
        field.squadShadow()
        return field
    }
    
}

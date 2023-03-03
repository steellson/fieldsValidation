//
//  TextField.swift
//
//  Created by Steellson
//

import UIKit


//MARK: - TextField

final class TextField: UITextField {

    
//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildTextField(with placeholder: String,
                                    _ color: CGColor,
                                    _ isSecure: Bool = false,
                                    _ type: UIKeyboardType = .default) -> UITextField {
            
        let field                   = UITextField()
        let spacer                  = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: field.frame.height))
        field.placeholder           = placeholder
        field.layer.backgroundColor = color
        field.leftView              = spacer
        field.isSecureTextEntry     = isSecure
        field.keyboardType          = type
        
        field.layer.borderWidth = 2
        field.textColor         = .black
        field.leftViewMode      = .always
        field.squadShadow()
        
        return field
    }
    
    
}

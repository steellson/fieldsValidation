//
//  UIView+Extension.swift//
//  Created by Steellson
//

import UIKit


extension UIView {
    
    //MARK: - Convenience
    
    func squadShadow() {
        layer.shadowOpacity = 1
        layer.shadowColor   = .init(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOffset  = .init(width: 5, height: 5)
    }
}

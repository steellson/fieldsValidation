//
//  UIView+Extension.swift//
//  Created by Steellson
//

import UIKit


extension UIView {
    
    //MARK: - Convenience
    
    convenience init(bgColor: UIColor,
                     subViews: [UIView]? = nil,
                     shadow: Bool = false,
                     border: CGFloat = 0.0) {
        self.init()
        
        self.backgroundColor = bgColor
        self.setBlackBorder(of: border)
        
        //subViews
        if let subViews = subViews {
            subViews.forEach { self.addSubview($0) }
        }
        
        //shadow
        if shadow {
            self.squadShadow()
        }
    }
    
    
    //MARK: - Methods
    
    func squadShadow() {
        layer.shadowOpacity = 1
        layer.shadowColor   = .init(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOffset  = .init(width: 3, height: 5)
    }
    
    func setBlackBorder(of width: CGFloat) {
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = width
    }
}

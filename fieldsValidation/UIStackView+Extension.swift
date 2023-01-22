//
//  UIStackView+Extension.swift
//  fieldsValidation
//
//  Created by Andrey Pochepaev on 22.01.2023.
//

import UIKit

extension UIStackView {
    
    //MARK: - Convenience setup
    
    convenience init(_ arrangedSubbviews: [UIView], _ axis: NSLayoutConstraint.Axis, _ spacing: CGFloat, _ distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubbviews)
        self.axis             = axis
        self.spacing          = spacing
        self.distribution     = distribution
    }
}

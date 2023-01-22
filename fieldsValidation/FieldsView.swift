//
//  FieldsView.swift
//
//  Created by Steellson
//

import UIKit

//MARK: - FieldsViewDelegate Protocol

protocol FieldsViewDelegate: AnyObject {
    
}

//MARK: - FieldsView

final class FieldsView: UIView {
    
    //MARK: Variables
    
    weak var delegate: FieldsViewDelegate?
    
    
//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - FieldsView Extension

@objc extension FieldsView {
    
    func setupView() {
        
        setupLayout()
    }
    
    func setupLayout() { }
}

//
//  RegistrationFieldView.swift
//
//  Created by Steellson
//

import UIKit

//MARK: - RegistrationFieldViewDelegate Protocol

protocol RegistrationFieldViewDelegate: AnyObject {
    
}

//MARK: - RegistrationFieldView

final class RegistrationFieldView: UIView {
    
    //MARK: Variables
    
    weak var delegate: RegistrationFieldViewDelegate?
        
    private var field: UITextField = {
        let field             = UITextField()
        field.borderStyle     = .line
        field.backgroundColor = #colorLiteral(red: 0.5298599601, green: 0.5298599601, blue: 0.5298599601, alpha: 1)
        field.textColor       = .white
        field.leftView        = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode    = .always
        field.placeholder     = "Field"
        field.squadShadow()
        return field
    }()
    
    private var title: UILabel = {
        let title           = UILabel()
        title.textColor     = #colorLiteral(red: 0.4986975789, green: 0.910484314, blue: 0.5441249609, alpha: 0.6792949235)
        title.textAlignment = .left
        title.font          = UIFont(name: "Arial", size: 15)
        title.text          = "Required field"
        title.squadShadow()
        return title
    }()
    
    var placeholder: String?
    
    
//MARK: - Init
    
    init(placeholder: String?) {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 100))

        self.placeholder = field.placeholder
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - RegistrationFieldView Extension

extension RegistrationFieldView {
    
    func setupView() {
        
        addSubview(field)
        addSubview(title)
        
        field.delegate = self
        
        setupLayout()
    }
    
    func setupLayout() {
        field.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: topAnchor),
            field.leadingAnchor.constraint(equalTo: leadingAnchor),
            field.trailingAnchor.constraint(equalTo: trailingAnchor),
            field.heightAnchor.constraint(equalToConstant: bounds.height / 2)
        ])
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: field.bottomAnchor, constant: 7),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 10)
        ])
        
    }
}

//MARK: - UITextFieldDelegate Extension

extension RegistrationFieldView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//
//  RegistrationControllerLayout.swift
//
//  Created by Steellson


import UIKit


//MARK: - RegistrationControllerLayout

extension RegistrationController {
    
    func setupLayout() {
        stackViewLayout()
    }
    
    private func stackViewLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 30),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.height - 210)
        ])
    }
}

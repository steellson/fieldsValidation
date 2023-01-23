//
//  RegistrationControllerLayout.swift
//
//  Created by Steellson


import UIKit


//MARK: - RegistrationControllerLayout

extension RegistrationController {
    
    func setupLayout() {
        registrationTitleLayout()
        signUpButtonLayout()
        stackViewLayout()
    }
    
    private func registrationTitleLayout() {
        registrationTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registrationTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.1),
            registrationTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func signUpButtonLayout() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height * 0.08)),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -260),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func stackViewLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: registrationTitle.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -25)
        ])
    }
}

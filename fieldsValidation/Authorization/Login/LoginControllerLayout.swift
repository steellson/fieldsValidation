//
//  LoginControllerLayout.swift
//
//  Created by Steellson


import UIKit


//MARK: - LoginControllerLayout

extension LoginController {
    
    func setupLayout() {
        unicornViewLayout()
        loginLabelLayout()
        emailFieldLayout()
        passwordFieldLayout()
        signInButtonLayout()
        signUpButtonLayout()
    }
    
    private func unicornViewLayout() {
        unicornView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            unicornView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.2),
            unicornView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            unicornView.widthAnchor.constraint(equalToConstant: 180),
            unicornView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func loginLabelLayout() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: unicornView.bottomAnchor),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func emailFieldLayout() {
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.widthAnchor.constraint(equalToConstant: view.frame.width - 60)
        ])
    }
    
    private func passwordFieldLayout() {
        passwordField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.widthAnchor.constraint(equalToConstant: view.bounds.width - 60)
        ])
    }

    private func signInButtonLayout() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5),
            signInButton.heightAnchor.constraint(equalTo: passwordField.heightAnchor)
        ])
    }

    private func signUpButtonLayout() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5),
            signUpButton.heightAnchor.constraint(equalTo: passwordField.heightAnchor)
        ])
    }
}

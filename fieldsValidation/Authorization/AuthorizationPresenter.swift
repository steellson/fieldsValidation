//
//  AuthorizationPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - AuthorizationControllerProtocol

protocol AuthorizationControllerProtocol: AnyObject {
    func showContent()
}


//MARK: - AuthorizationPresenterProtocol

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationControllerProtocol, router: AuthorizationRouterProtocol)
    func signInButtonDidTapped()
    func signUpButtonDidTapped()
}


//MARK: - AuthorizationPresenter

final class AuthorizationPresenter: AuthorizationPresenterProtocol {
    
    //MARK: Variables
    
    weak var view : AuthorizationControllerProtocol!
    var router    : AuthorizationRouterProtocol!
    
    //MARK: - Init
    
    required init(view: AuthorizationControllerProtocol, router: AuthorizationRouterProtocol) {
        self.view   = view
        self.router = router
    }
    
    
    //MARK: - LoginController Methods
    
    func signInButtonDidTapped() {
        print("signIn")
    }
    
    func signUpButtonDidTapped() {
        router.goToRegistration()
    }
    
    //MARK: - RegistrationController Methods

   
}

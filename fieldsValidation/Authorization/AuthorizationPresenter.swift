//
//  AuthorizationPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - AuthorizationPresenterProtocol

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationControllerProtocol, router: AuthorizationRouterProtocol)

}


//MARK: - AuthorizationPresenter

final class AuthorizationPresenter: AuthorizationPresenterProtocol {
    
    //MARK: Variables
    
    weak var view: AuthorizationControllerProtocol!
    
    //MARK: - Init
    
    required init(view: AuthorizationControllerProtocol, router: AuthorizationRouterProtocol) {
        self.view = view

    }
    
    
    //MARK: - Methods
    
   
}

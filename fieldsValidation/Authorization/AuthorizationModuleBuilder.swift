//
//  AuthorizationModuleBuilder.swift
//
//  Created by Steellson


import UIKit


//MARK: - AuthorizationModuleBuilder Protocol

protocol AuthorizationModuleBuilderProtocol: AuthorizationModuleBuilder {    
    func buildAuthorizationController(router: AuthorizationRouterProtocol) -> UIViewController
}


//MARK: AuthorizationModuleBuilderImpl

final class AuthorizationModuleBuilder: AuthorizationModuleBuilderProtocol {
        
   public func buildAuthorizationController(router: AuthorizationRouterProtocol) -> UIViewController {
        let view        = AuthorizationController()
        let presenter   = AuthorizationPresenter(view: view, router: router)
        view.presenter  = presenter
        return view
    }
   
}

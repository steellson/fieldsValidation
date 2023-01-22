//
//  AuthorizationModuleBuilder.swift
//
//  Created by Steellson


import UIKit


//MARK: - AuthorizationModuleBuilder Protocol

protocol AuthorizationModuleBuilderProtocol: AuthorizationModuleBuilder {    
    func buildLoginController(router: AuthorizationRouterProtocol) -> UIViewController
    func buildRegistrationController(router: AuthorizationRouterProtocol) -> UIViewController
}


//MARK: AuthorizationModuleBuilderImpl

final class AuthorizationModuleBuilder: AuthorizationModuleBuilderProtocol {
    
    public func buildLoginController(router: AuthorizationRouterProtocol) -> UIViewController {
         let view        = LoginController()
         let presenter   = AuthorizationPresenter(view: view, router: router)
         view.presenter  = presenter
         return view
     }
    
    public func buildRegistrationController(router: AuthorizationRouterProtocol) -> UIViewController {
         let view        = RegistrationController()
         let presenter   = AuthorizationPresenter(view: view, router: router)
         view.presenter  = presenter
         return view
     }
   
}

//
//  AuthorizationRouter.swift
//
//  Created by Steellson


import UIKit

//MARK: - AuthorizationRouter Protocol

protocol AuthorizationRouterProtocol {
    var moduleBuilder        : AuthorizationModuleBuilderProtocol? { get set }
    var navigationController : UINavigationController? { get set }
    
    func initialView()
    func goToRegistration()
    func goBack()
}



//MARK: - AuthorizationRouterImpl

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    //MARK: - Variables
    
    var moduleBuilder        : AuthorizationModuleBuilderProtocol?
    var navigationController : UINavigationController?
    
    //MARK: - Init
    
    init(moduleBuilder: AuthorizationModuleBuilderProtocol?, navigationController: UINavigationController?) {
        self.moduleBuilder        = moduleBuilder
        self.navigationController = navigationController
    }
    
    
    //MARK: - Methods
    
    func initialView() {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            let loginController  = moduleBuilder.buildLoginController(router: self)
            navigationController.pushViewController(loginController, animated: true)
        } else {
            print("InitialView Debug")
        }
    }
    
    func goToRegistration()  {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            navigationController.present(moduleBuilder.buildRegistrationController(router: self), animated: true)
        } else {
            print("GoToRegistration Debug")
        }
    }
    
    func goBack() {
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true)
        } else {
            print("GoBackButton Debug")
        }
    }
}

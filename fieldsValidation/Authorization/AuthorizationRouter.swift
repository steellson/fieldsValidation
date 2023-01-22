//
//  AuthorizationRouter.swift
//
//  Created by Steellson


import UIKit

//MARK: - AuthorizationRouter Protocol

protocol AuthorizationRouterProtocol {
    var moduleBuilder : AuthorizationModuleBuilderProtocol? { get set }
    init(moduleBuilder: AuthorizationModuleBuilderProtocol?)
    
    func initialView() -> UIViewController
    func goToRegistration()
    func goBack(_ from: UIViewController?)
}



//MARK: - AuthorizationRouterImpl

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    //MARK: - Variables
    
    var view          : AuthorizationControllerProtocol?
    var moduleBuilder : AuthorizationModuleBuilderProtocol?
    
    
    //MARK: - Init
    
    required init(moduleBuilder: AuthorizationModuleBuilderProtocol?) {
        self.moduleBuilder = moduleBuilder
    }
    
    
    //MARK: - Methods
    
    func initialView() -> UIViewController {
        if let moduleBuilder = moduleBuilder {
            let mainViewController  = moduleBuilder.buildLoginController(router: self)
            return mainViewController
        } else {
            print("InitialView Debug")
        }
        return UIViewController()
    }
    
    func goToRegistration()  {
        let vc = LoginController()
        if let moduleBuilder = moduleBuilder {
            let regController  = moduleBuilder.buildRegistrationController(router: self)
            vc.present(regController, animated: true)
        } else {
            print("GoToRegistration Debug")
        }
    }
    
    func goBack(_ from: UIViewController?) {
        if let controller = from {
            controller.dismiss(animated: true)
        } else {
            print("GoBackButtonError")
        }
    }
}

//
//  AuthorizationRouter.swift
//
//  Created by Steellson


import UIKit

//MARK: - AuthorizationRouter Protocol

protocol AuthorizationRouterProtocol {
    var moduleBuilder        : AuthorizationModuleBuilderProtocol? { get set }
    init(viewController: UIViewController?, moduleBuilder: AuthorizationModuleBuilderProtocol?)
    
    func initialView() -> UIViewController
    func goToRegistration()
    func goBack(_ from: UIViewController?)
}



//MARK: - AuthorizationRouterImpl

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    //MARK: - Variables
    
    var viewController      : UIViewController?
    var moduleBuilder       : AuthorizationModuleBuilderProtocol?
    
    
    //MARK: - Init
    
    required init(viewController: UIViewController?, moduleBuilder: AuthorizationModuleBuilderProtocol?) {
        self.viewController = viewController
        self.moduleBuilder = moduleBuilder
    }
    
    
    //MARK: - Methods
    
    func initialView() -> UIViewController {
        if let moduleBuilder = moduleBuilder {
            let mainViewController  = moduleBuilder.buildLoginController(router: self)
            return mainViewController
        }
        return UIViewController()
    }
    
    func goToRegistration()  {
        if let viewController = viewController, let moduleBuilder = moduleBuilder {
            let regController  = moduleBuilder.buildRegistrationController(router: self)
            viewController.present(regController, animated: true)
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

//
//  Router.swift
//
//  Created by Steellson


import UIKit

//MARK: - Router Protocol

protocol RouterProtocol {
    var moduleBuilder        : ModuleBuilderProtocol? { get set }
    var navigationController : UINavigationController? { get set }
    
    func authorizationInitialView()
    func goToRegistration()
    func goHome()
}



//MARK: - RouterImpl

final class Router: RouterProtocol {
    
    //MARK: - Variables
    
    var moduleBuilder        : ModuleBuilderProtocol?
    var navigationController : UINavigationController?
    
    //MARK: - Init
    
    init(moduleBuilder: ModuleBuilderProtocol?, navigationController: UINavigationController?) {
        self.moduleBuilder        = moduleBuilder
        self.navigationController = navigationController
    }
    
    
    //MARK: - Methods
    
    func authorizationInitialView() {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            let loginController  = moduleBuilder.buildLoginController(router: self)
            navigationController.pushViewController(loginController, animated: true)
        } else {
            print("InitialView Debug")
        }
    }
    
    func goToRegistration()  {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            let regController = moduleBuilder.buildRegistrationController(router: self)
            navigationController.present(regController, animated: true)
        } else {
            print("GoToRegistration Debug")
        }
    }
    
    func goHome() {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            let homeController = moduleBuilder.buildHomeController(router: self)
            navigationController.pushViewController(homeController, animated: true)
        }
    }
}

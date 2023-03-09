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
    func goDetail(with item: Photo.PhotoElement)
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
    
    
    //MARK: - Authorization
    
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
    
    //MARK: - Main
    
    func goHome() {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            let homeController = moduleBuilder.buildHomeController(router: self)
            navigationController.pushViewController(homeController, animated: true)
        } else {
            print("GoHome Debug")
        }
    }
    
    func goDetail(with item: Photo.PhotoElement) {
        if let moduleBuilder = moduleBuilder, let navigationController = navigationController {
            let detailController = moduleBuilder.buildDetailController(router: self, item: item)
            navigationController.pushViewController(detailController, animated: true)
        } else {
            print("GoDetail Debug")
        }
    }
}

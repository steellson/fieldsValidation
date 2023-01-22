//
//  AuthorizationRouter.swift
//
//  Created by Steellson


import UIKit

//MARK: - AuthorizationRouter Protocol

protocol AuthorizationRouterProtocol {
    var moduleBuilder        : AuthorizationModuleBuilderProtocol? { get set }
    init(navigationController: UINavigationController?, moduleBuilder: AuthorizationModuleBuilderProtocol?)
    
    func initialView() -> UIViewController
    func goBack(_ from: UIViewController?)
}



//MARK: - AuthorizationRouterImpl

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    //MARK: - Variables
    
    var navigationController: UINavigationController?
    var moduleBuilder       : AuthorizationModuleBuilderProtocol?
    
    
    //MARK: - Init
    
    required init(navigationController: UINavigationController?, moduleBuilder: AuthorizationModuleBuilderProtocol?) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    
    //MARK: - Methods
    
    func initialView() -> UIViewController {
        if let moduleBuilder = moduleBuilder {
            let mainViewController  = moduleBuilder.buildAuthorizationController(router: self)
            return mainViewController
        }
        return UIViewController()
    }
    
    func goBack(_ from: UIViewController?) {
        if let controller = from {
            controller.dismiss(animated: true)
        } else {
            print("GoBackButtonError")
        }
    }
}

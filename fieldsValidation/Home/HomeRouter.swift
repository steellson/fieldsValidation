//
//  HomeRouter.swift
//
//  Created by Steellson


import UIKit

//MARK: - HomeRouter Protocol

protocol HomeRouterProtocol {
    var moduleBuilder        : HomeModuleBuilderProtocol? { get set }
    init(navigationController: UINavigationController?, moduleBuilder: HomeModuleBuilderProtocol?)
    
    func initialView()
    func goBack()
}



//MARK: - HomeRouterImpl

final class HomeRouter: HomeRouterProtocol {
    
    //MARK: - Variables
    
    var navigationController: UINavigationController?
    var moduleBuilder       : HomeModuleBuilderProtocol?
    
    
//MARK: - Init
    
    required init(navigationController: UINavigationController?, moduleBuilder: HomeModuleBuilderProtocol?) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    
//MARK: - Methods
    
    func initialView() {
        if let navigationController = navigationController, let moduleBuilder = moduleBuilder {
            let mainViewController  = moduleBuilder.buildHomeController(router: self)
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func goBack() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}

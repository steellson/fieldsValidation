//
//  ModuleBuilder.swift
//
//  Created by Steellson


import UIKit


//MARK: - ModuleBuilder Protocol

protocol ModuleBuilderProtocol: ModuleBuilder {    
    func buildLoginController(router: RouterProtocol) -> UIViewController
    func buildRegistrationController(router: RouterProtocol) -> UIViewController
    func buildHomeController(router: RouterProtocol) -> UIViewController
    func buildDetailController(router: RouterProtocol) -> UIViewController
}


//MARK: ModuleBuilderImpl

final class ModuleBuilder: ModuleBuilderProtocol {
    
    public func buildLoginController(router: RouterProtocol) -> UIViewController {
        let view                = LoginController()
        let userDefaultsManager = UserDefaultsManager()
        let presenter           = AuthorizationPresenter(view: view, userDefaultsManager: userDefaultsManager, router: router)
        view.presenter          = presenter
        return view
    }
    
    public func buildRegistrationController(router: RouterProtocol) -> UIViewController {
        let view                = RegistrationController()
        let userDefaultsManager = UserDefaultsManager()
        let presenter           = AuthorizationPresenter(view: view, userDefaultsManager: userDefaultsManager, router: router)
        view.presenter          = presenter
        return view
    }
    
    public func buildHomeController(router: RouterProtocol) -> UIViewController {
        let view        = HomeController()
        let apiManager  = APIManager()
        let presenter   = HomePresenter(view: view, router: router, apiManager: apiManager)
        view.presenter  = presenter
        return view
    }
    
    public func buildDetailController(router: RouterProtocol) -> UIViewController {
        let view        = DetailController()
        let apiManager  = APIManager()
        let presenter   = DetailPresenter(view: view, router: router, apiManager: apiManager)
        view.presenter  = presenter
        return view
    }
}

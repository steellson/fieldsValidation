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
    func buildDetailController(router: RouterProtocol, item: Photo.PhotoElement) -> UIViewController
}


//MARK: ModuleBuilderImpl

final class ModuleBuilder: ModuleBuilderProtocol {
    
    public func buildLoginController(router: RouterProtocol) -> UIViewController {
        let view                = LoginController()
        let userDefaultsManager = UserDefaultsManager()
        let presenter           = LoginPresenter(view: view, userDefaultsManager: userDefaultsManager, router: router)
        view.presenter          = presenter
        return view
    }
    
    public func buildRegistrationController(router: RouterProtocol) -> UIViewController {
        let view                = RegistrationController()
        let userDefaultsManager = UserDefaultsManager()
        let presenter           = RegistrationPresenter(view: view, userDefaultsManager: userDefaultsManager, router: router)
        view.presenter          = presenter
        return view
    }
    
    public func buildHomeController(router: RouterProtocol) -> UIViewController {
        let view        = HomeController()
        let networkMan  = NetworkManager()
        let presenter   = HomePresenter(view: view, router: router, networkManager: networkMan)
        view.presenter  = presenter
        return view
    }
    
    public func buildDetailController(router: RouterProtocol, item: Photo.PhotoElement) -> UIViewController {
        let view        = DetailController()
        let networkMan  = NetworkManager()
        let presenter   = DetailPresenter(view: view, router: router, networkManager: networkMan, item: item)
        view.presenter  = presenter
        return view
    }
}

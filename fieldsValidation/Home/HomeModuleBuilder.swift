//
//  HomeModuleBuilder.swift
//
//  Created by Steellson


import Foundation
import UIKit

//MARK: - HomeModuleBuilder Protocol

protocol HomeModuleBuilderProtocol: HomeModuleBuilder {    
    func buildHomeController(router: HomeRouterProtocol) -> UIViewController
}


//MARK: HomeModuleBuilderImpl

final class HomeModuleBuilder: HomeModuleBuilderProtocol {
        
   public func buildHomeController(router: HomeRouterProtocol) -> UIViewController {
        let view        = HomeController()
        let presenter   = HomePresenter(view: view, router: router)
        view.presenter  = presenter
        return view
    }
   
}

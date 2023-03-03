//
//  HomePresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - HomeControllerProtocol

protocol HomeControllerProtocol: AnyObject {
    func showContent()
}

//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol, router: HomeRouterProtocol, apiManager: APIManagerProtocol)
    var objects: [RequestedObject]? { get set }
    
    func loadData()
}


//MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    weak var view: HomeControllerProtocol!
    var router: HomeRouterProtocol?
    var apiManager: APIManagerProtocol?
    var objects: [RequestedObject]?
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol, router: HomeRouterProtocol, apiManager: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
    }
    
    
    //MARK: - Methods
    
    func loadData() {
        //
    }
}

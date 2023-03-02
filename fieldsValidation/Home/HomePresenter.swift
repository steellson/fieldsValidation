//
//  HomePresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - HomeControllerProtocol

protocol HomeControllerProtocol: AnyObject {
    func loadingStarted()
    func loadingFinished()
}

//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol, router: HomeRouterProtocol)
    var objects: [RequestedObject]? { get set }

}


//MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    weak var view: HomeControllerProtocol!
    var router: HomeRouterProtocol?
    var objects: [RequestedObject]?
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    //MARK: - Methods
    
   
}

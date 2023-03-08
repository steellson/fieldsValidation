//
//  DetailPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - DetailControllerViewProtocol

protocol DetailControllerViewProtocol: AnyObject {
    
}

//MARK: - DetailPresenterProtocol

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailControllerViewProtocol,
         router: RouterProtocol,
         apiManager: APIManagerProtocol)

}


//MARK: - DetailPresenter

final class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: DetailControllerViewProtocol!
    private var router: RouterProtocol?
    private var apiManager: APIManagerProtocol?
    
    //MARK: - Init
    
    required init(view: DetailControllerViewProtocol,
                  router: RouterProtocol,
                  apiManager: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
    }
    
    
    //MARK: - Methods
    
   
}

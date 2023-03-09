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
         apiManager: NetworkManagerProtocol)

}


//MARK: - DetailPresenter

final class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: DetailControllerViewProtocol!
    private var router: RouterProtocol?
    private var apiManager: NetworkManagerProtocol?
    
    //MARK: - Init
    
    required init(view: DetailControllerViewProtocol,
                  router: RouterProtocol,
                  apiManager: NetworkManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
    }
    
    
    //MARK: - Methods
    
   
}

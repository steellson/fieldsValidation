//
//  DetailPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - DetailControllerViewProtocol

protocol DetailControllerViewProtocol: AnyObject {
    func configureView()
}

//MARK: - DetailPresenterProtocol

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailControllerViewProtocol,
         router: RouterProtocol,
         networkManager: NetworkManagerProtocol,
         item: Photo.PhotoElement)
    
    var item: Photo.PhotoElement? { get set }
    
    func viewDidLoaded()
}


//MARK: - DetailPresenter

final class DetailPresenter: DetailPresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: DetailControllerViewProtocol!
    private var router: RouterProtocol?
    private var networkManager: NetworkManagerProtocol?
    
    var item: Photo.PhotoElement?
    
    //MARK: - Init
    
    required init(view: DetailControllerViewProtocol,
                  router: RouterProtocol,
                  networkManager: NetworkManagerProtocol,
                  item: Photo.PhotoElement) {
        
        self.view           = view
        self.router         = router
        self.networkManager = networkManager
        self.item          = item
    }
    
    
    //MARK: - Methods
    
    func viewDidLoaded() {
        view.configureView()
    }
}


//MARK: - DetailPresenter Private Extension

extension DetailPresenter {
    
}

//
//  HomePresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - HomeControllerProtocol

protocol HomeControllerProtocol: AnyObject {
    func showContent()
    func updateView()
}


//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol)
    var photos: Photo? { get set }
    
    func loadData(from url: String, completion: @escaping (Photo) -> Void)
}


//MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: HomeControllerProtocol!
    private var router: RouterProtocol?
    private var apiManager: APIManagerProtocol?

    var photos: Photo?
    
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
    }
    
    //MARK: - Methods
    
    func loadData(from url: String, completion: @escaping (Photo) -> Void) {
        
        apiManager!.getData(from: url) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(photos: let photos):
                    self.photos = photos
                    completion(photos)
                case .error(error: let error):
                    print("Load data error: \(error.localizedDescription)")
                }
                
            }
        }
    }
}

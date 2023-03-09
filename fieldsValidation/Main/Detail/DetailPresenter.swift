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
    func getImage(from url: String, completion: @escaping (Any) -> Void)
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
        self.item           = item
    }
    
    
    //MARK: - Methods
    
    func viewDidLoaded() {
        view.configureView()
    }
    
    func getImage(from url: String, completion: @escaping (Any) -> Void) {
        loadImageData(from: url) { data in
            completion(data)
        }
    }
}


//MARK: HomePresenter Private Extension

private extension DetailPresenter {
    
    func loadImageData(from url: String, completion: @escaping (Any) -> Void) {
        
        networkManager?.getImage(from: url) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(items: let items):
                    guard let items = items as? Data else { return }
                    completion(items)
                case .error(error: let error):
                    completion(error)
                }
            }
        }
    }
}

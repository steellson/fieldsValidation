//
//  HomePresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - HomeControllerProtocol

protocol HomeControllerProtocol: AnyObject {
    func updateView()
}

//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol,
         router: RouterProtocol,
         networkManager: NetworkManagerProtocol)
    
    var photos: Photo? { get set }
    
    func viewDidLoaded()
    func getImage(from url: String, completion: @escaping (Any) -> Void)
    func didTapped(itemPosition: Int, item: Photo.PhotoElement)
}


//MARK: - HomePresenterImpl

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: HomeControllerProtocol!
    private var router: RouterProtocol?
    private var networkManager: NetworkManagerProtocol?

    var photos: Photo?
    
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol,
                  router: RouterProtocol,
                  networkManager: NetworkManagerProtocol) {
        
        self.view           = view
        self.router         = router
        self.networkManager = networkManager
    }
    
    //MARK: - Methods
    
    func viewDidLoaded() {
        loadData(from: Resources.RURLs.tempURL.rawValue)
    }
    
    func getImage(from url: String, completion: @escaping (Any) -> Void) {
        loadImageData(from: url) { data in
            completion(data)
        }
    }
    
    
    func didTapped(itemPosition: Int, item: Photo.PhotoElement) {
        guard let item = photos?.photos?[itemPosition] else { return }
        router?.goDetail(with: item)
    }
}


//MARK: HomePresenter Private Extension

private extension HomePresenter {
    
    func loadData(from url: String) {
        
        networkManager!.getData(from: url, method: .GET, model: photos) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(items: let items):
                    guard let items = items as? Photo else { return }
                    self.photos = items
                    self.view.updateView()
                case .error(error: let error):
                    print("Load data error: \(error.localizedDescription)")
                }
            }
        }
    }
    
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

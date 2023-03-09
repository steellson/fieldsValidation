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
         apiManager: NetworkManagerProtocol)
    
    var photos: Photo? { get set }
    
    func loadData(from url: String)
    func didTapped(item: Int)
}


//MARK: - HomePresenterImpl

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: HomeControllerProtocol!
    private var router: RouterProtocol?
    private var apiManager: NetworkManagerProtocol?
    
    var photos: Photo?
    
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol,
                  router: RouterProtocol,
                  apiManager: NetworkManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
    }
    
    //MARK: - Methods
    
    func loadData(from url: String) {
        
        apiManager!.getData(from: url, method: .GET, model: photos) { [weak self] result in
            
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

    
    func didTapped(item: Int) {
        guard let item = photos?.photos?[item].camera else { return }
        router?.goDetail()
        print("item: \(item)")
    }
}

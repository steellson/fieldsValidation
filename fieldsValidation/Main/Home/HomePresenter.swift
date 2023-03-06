//
//  HomePresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - HomeControllerProtocol

protocol HomeControllerProtocol: AnyObject {
    func showContent()
}

//MARK: - HomeCollectionCellProtocol

protocol HomeConllectionCellProtocol: AnyObject {
    
}


//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol)
    var photos: [Photo] { get set }
    
    func loadData(from url: String)
}


//MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: HomeControllerProtocol!
    private var router: RouterProtocol?
    private var apiManager: APIManagerProtocol?
    
    var photos: [Photo] {
        get {
            [Photo]()
        }
        set {
            print("Appended: \(newValue)")
            view.showContent()
        }
    }
    
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
        
        loadData(from: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&page=2&api_key=MqLemK0jlboyscMMHnqpsCYHC1AwJI915p87A0uV")
    }
    
    //MARK: - Methods
    
    func loadData(from url: String) {
        
        apiManager!.getData(from: url) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(photos: let photos):
                    self.photos.append(photos)
                    
                case .error(error: let error):
                    print("Load data error: \(error.localizedDescription)")
                }
                
            }
        }
    }
}

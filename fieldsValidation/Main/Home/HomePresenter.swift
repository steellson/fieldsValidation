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

//MARK: - HomeCollectionCellProtocol

protocol HomeConllectionCellProtocol: AnyObject {
    
}


//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol)
    var photos: [Photo] { get set }
    var numberOfItems: Int? { get set }
    
    func loadData(from url: String, completion: @escaping ([Photo]) -> Void)
}


//MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    private weak var view: HomeControllerProtocol!
    private var router: RouterProtocol?
    private var apiManager: APIManagerProtocol?
    
    var numberOfItems: Int? 
    var photos: [Photo] {
        get {
            [Photo]()
        }
        set {
            print("Appended: \(newValue)")
        }
    }
    
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
    }
    
    //MARK: - Methods
    
    func loadData(from url: String, completion: @escaping ([Photo]) -> Void) {
        
        apiManager!.getData(from: url) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(photos: let photos):
                    self.photos.append(photos)
                    completion([photos])
                    print("Count: \(self.numberOfItems ?? 0)")
                case .error(error: let error):
                    print("Load data error: \(error.localizedDescription)")
                }
                
            }
        }
    }
}

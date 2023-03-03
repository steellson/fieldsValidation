//
//  HomePresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - HomeControllerProtocol

protocol HomeControllerProtocol: AnyObject {
    func showContent()
}

//MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol)
    var objects: [RequestedObject] { get set }
    
    func loadData(from url: String)
}


//MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: Variables
    
    weak var view: HomeControllerProtocol!
    var router: RouterProtocol?
    var apiManager: APIManagerProtocol?
    var objects = [RequestedObject]()
    
    //MARK: - Init
    
    required init(view: HomeControllerProtocol, router: RouterProtocol, apiManager: APIManagerProtocol) {
        self.view = view
        self.router = router
        self.apiManager = apiManager
        
    }
    
    
    //MARK: - Methods
    
    func loadData(from url: String) {
        guard let apiManager = apiManager else { return }
        apiManager.getData(from: url, completion: { result in
                switch result {
                case .success(let data):
                    print(data)
                    data.forEach { self.objects.append($0) }
                case .failure(let error):
                    print("Loading data error: \(error.localizedDescription)")
                }
        })
    }
}

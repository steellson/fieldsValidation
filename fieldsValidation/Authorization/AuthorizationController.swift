//
//  AuthorizationController.swift
//
//  Created by Steellson


import UIKit

//MARK: - AuthorizationControllerProtocol

protocol AuthorizationControllerProtocol: AnyObject {
    
}


//MARK: - AuthorizationController

final class AuthorizationController: UIViewController {
    
    var presenter: AuthorizationPresenterProtocol!
    
    //MARK: - UI Elements
    
    
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

}


//MARK: - AuthorizationController Extension

extension AuthorizationController {
    
    private func setupView() {
      
    }

}


//MARK: - AuthorizationControllerViewProtocol Extension

extension AuthorizationController: AuthorizationControllerProtocol {
    
}


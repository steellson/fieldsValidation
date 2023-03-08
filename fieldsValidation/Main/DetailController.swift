//
//  DetailController.swift
//
//  Created by Steellson


import UIKit


//MARK: - DetailController

final class DetailController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    //MARK: - UI Elements
    
    
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}


//MARK: - DetailController Extension

private extension DetailController {
    
    func setupView() {
        view.backgroundColor = Resources.RColors.purpleMainColor

        setupLayout()
        setupNavBar()
    }

    func setupNavBar() {

    }
}


//MARK: - DetailControllerViewProtocol Extension

extension DetailController: DetailControllerViewProtocol {
    
}


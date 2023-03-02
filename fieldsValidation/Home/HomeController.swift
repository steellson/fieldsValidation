//
//  HomeController.swift
//
//  Created by Steellson


import UIKit


//MARK: - HomeController

final class HomeController: UIViewController {
    
    
    //MARK: - UI Elements
    
    var collectionView: UICollectionView!
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
}


//MARK: - HomeController Extension

private extension HomeController {
    
    func setupView() {
        view.backgroundColor = Resources.RColors.defaultBackgroundColor
        
        setupCollectionView()
        setupLayout()
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.cellId)
        
        
        view.addSubview(collectionView)
    }
    
}

//
////MARK: - HomeControllerViewProtocol Extension
//
//extension HomeController: HomeControllerViewProtocol {
//
//}


//MARK: - HomeCollectionView Data Source Extension

extension HomeController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  HomeCollectionCell.cellId, for: indexPath) as! HomeCollectionCell
        
        return cell
    }
    
}

//MARK: HomeCollectionView Flow Delegate Extension

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width - 30, height: 120)
    }
}
//
//  HomeControllerLayout.swift
//
//  Created by Steellson


import UIKit


//MARK: - HomeControllerLayout

extension HomeController {
    
    func setupLayout() {
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

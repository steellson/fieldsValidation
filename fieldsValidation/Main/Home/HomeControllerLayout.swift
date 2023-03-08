//
//  HomeControllerLayout.swift
//
//  Created by Steellson


import UIKit


//MARK: - HomeControllerLayout

extension HomeController {

    func setupLayout() {
        titleLabelLayout()
        collectionViewLayout()
    }
    
    //MARK: - Methods
    
    private func titleLabelLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
        ])
    }
    
    private func collectionViewLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

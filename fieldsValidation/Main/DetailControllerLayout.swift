//
//  DetailControllerLayout.swift
//
//  Created by Steellson


import UIKit


//MARK: - DetailControllerLayout

extension DetailController {
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func setupLayout() {
        titleLabelLayout()
        containerViewLayout()
        mainViewLayout()
        imageViewLayout()
        descriptionTitleViewLayout()
        descriptionSubtitleViewLayout()
    }
    
    //MARK: - Methods

    private func titleLabelLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    private func containerViewLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            containerView.heightAnchor.constraint(equalToConstant: screenHeight / 1.8)
        ])
    }
    
    private func mainViewLayout() {
        mainView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            mainView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            mainView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            mainView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
    }
    
    private func imageViewLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 220),
            imageView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    private func descriptionTitleViewLayout() {
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptionTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            descriptionTitle.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            descriptionTitle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
        ])
    }
    
    private func descriptionSubtitleViewLayout() {
        descritionSubtitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descritionSubtitle.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 10),
            descritionSubtitle.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            descritionSubtitle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
        ])
    }
}

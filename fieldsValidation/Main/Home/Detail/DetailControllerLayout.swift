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
        cameraNameLabelLayout()
        roverNameLabelLayout()
        earthDateLabelLayout()
        landingDateLabelLayout()
        statusLabelLayout()
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
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 220),
            imageView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    private func cameraNameLabelLayout() {
        cameraNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cameraNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            cameraNameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            cameraNameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
        ])
    }
    
    private func roverNameLabelLayout() {
        roverNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roverNameLabel.topAnchor.constraint(equalTo: cameraNameLabel.bottomAnchor, constant: 10),
            roverNameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            roverNameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
        ])
    }
    
    private func earthDateLabelLayout() {
        earthDateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            earthDateLabel.topAnchor.constraint(equalTo: roverNameLabel.bottomAnchor, constant: 15),
            earthDateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            earthDateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
        ])
    }
    
    private func landingDateLabelLayout() {
        landingDateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            landingDateLabel.topAnchor.constraint(equalTo: earthDateLabel.bottomAnchor, constant: 5),
            landingDateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            landingDateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
        ])
    }
    
    private func statusLabelLayout() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            statusLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10)
        ])
    }
}

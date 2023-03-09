//
//  HomeController.swift
//
//  Created by Steellson


import UIKit


//MARK: - HomeController

final class HomeController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    //MARK: - UI Elements
    
    let titleLabel = UILabel(Resources.RFonts.helveticaBold40, .white, .left, "PICK FOR MORE")
    var collectionView: UICollectionView!
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter.viewDidLoaded()
    }
}


//MARK: - HomeController Extension

private extension HomeController {
    
    func setupView() {
        view.backgroundColor = Resources.RColors.purpleMainColor
        view.addSubview(titleLabel)
        
        setupNavBar()
        setupCollectionView()
        setupLayout()
    }
    
    func setupNavBar() {
        navigationItem.hidesBackButton = true
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


//MARK: - HomeControllerViewProtocol Extension

extension HomeController: HomeControllerProtocol {
    
    func updateView() {
        self.collectionView.reloadData()
    }
}


//MARK: - HomeCollectionView Data Source Extension

extension HomeController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.photos?.photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  HomeCollectionCell.cellId,
                                                            for: indexPath) as? HomeCollectionCell,
              let title = presenter.photos?.photos?[indexPath.item].earthDate,
              let imageUrl = presenter.photos?.photos?[indexPath.item].imgSrc else { return UICollectionViewCell() }
                
        presenter.getImage(from: imageUrl) { data in
            guard let data = data as? Data else { return }
            let image = UIImage(data: data)
            cell.configureCell(with: image, title: title)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didTapped(item: indexPath.item)
    }
}

//MARK: HomeCollectionView Flow Delegate Extension

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width - 30, height: 120)
    }
}

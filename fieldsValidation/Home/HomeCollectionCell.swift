//
//  HomeCollectionCell.swift
//
//  Created by Steellson


import UIKit

//MARK: - HomeCollectionCell

final class HomeCollectionCell: UICollectionViewCell {
    
    static let cellId = Resources.RCellsId.homeCollectionViewCellId.rawValue
    
    //MARK: UI Elements
    
    private var imageView : UIImageView!
    
    
    
//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    
//MARK: - Setup Cell
    
    func configureCell(with image: UIImage?) {
        self.imageView.image = image
    }
    
    private func setupCell() {
        backgroundColor = Resources.RColors.defaultTextFieldGrayColor

        setupImageView()
        setupLayout()
        squadShadow()
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        
        addSubview(imageView)
    }
 
}

//MARK: - Layout Extension

extension HomeCollectionCell {
    
    private func setupLayout() {
        imageViewLayout()
    }
    
    private func imageViewLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
}

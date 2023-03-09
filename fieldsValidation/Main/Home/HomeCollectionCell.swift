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
    private var title     : UILabel!
    
    
//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//MARK: - Setup Cell
    
    func configureCell(with image: UIImage?, title: String) {
        self.imageView.image = image
        self.title.text      = title
    }
    

}

//MARK: - Setup methods extension

private extension HomeCollectionCell {
    
    func setupCell() {
        backgroundColor = Resources.RColors.grayColor

        setupImageView()
        setupTitle()
        setupLayout()
        squadShadow()
    }
    
    func setupImageView() {
        imageView               = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode   = .scaleAspectFill
        
        addSubview(imageView)
    }
    
    func setupTitle() {
        title           = UILabel()
        title.textColor = Resources.RColors.grayColor
        title.font      = Resources.RFonts.helvetica15
        
        imageView.addSubview(title)
    }
}

//MARK: - Layout Extension

private extension HomeCollectionCell {
    
    func setupLayout() {
        imageViewLayout()
        titleLayout()
    }
    
    func imageViewLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func titleLayout() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -5),
            title.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5)
        ])
    }
    
}

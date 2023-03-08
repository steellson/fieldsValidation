//
//  DetailController.swift
//
//  Created by Steellson


import UIKit


//MARK: - DetailController

final class DetailController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    //MARK: - UI Elements
    
    let titleLabel  = UILabel(Resources.RFonts.helveticaBold40, .black, .left, "INFO")
    
    lazy var containerView = UIView(bgColor: Resources.RColors.grayColor, subViews: [mainView], shadow: true, border: 0.5)
    lazy var mainView = UIView(bgColor: .black, subViews: [
        imageView, descriptionTitle, descritionSubtitle
    ])
    var imageView = UIImageView(image: Resources.RImages.defaultImage)
    var descriptionTitle = UILabel(Resources.RFonts.helveticaBold28, .white, .left, "loading...")
    var descritionSubtitle = UILabel(Resources.RFonts.helveticaBold20, Resources.RColors.grayColor, .left, "loading...")
    
    
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
        
        view.addSubview(titleLabel)
        view.addSubview(containerView)

        setupLayout()
    }
}


//MARK: - DetailControllerViewProtocol Extension

extension DetailController: DetailControllerViewProtocol {
    
}


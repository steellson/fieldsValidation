//
//  DetailController.swift
//
//  Created by Steellson


import UIKit


//MARK: - DetailController

final class DetailController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    //MARK: - UI Elements
    
    // Main
    let titleLabel         = UILabel(Resources.RFonts.helveticaBold40, .white, .left, "INFO")
    lazy var containerView = UIView(bgColor: Resources.RColors.grayColor, subViews: [mainView], shadow: true, border: 0.5)
    lazy var mainView      = UIView(bgColor: .black, subViews: [
        imageView, cameraNameLabel, roverNameLabel, earthDateLabel, landingDateLabel, statusLabel
    ])
    
    // Card
    var imageView        = UIImageView(image: Resources.RImages.defaultImage)
    var cameraNameLabel  = UILabel(Resources.RFonts.helveticaBold28, .white, .left, "loading...")
    var roverNameLabel   = UILabel(Resources.RFonts.helveticaBold20, Resources.RColors.grayColor, .left, "loading...")
    var earthDateLabel   = UILabel(Resources.RFonts.helvetica12, Resources.RColors.grayColor, .left, "loading...")
    var landingDateLabel = UILabel(Resources.RFonts.helvetica12, Resources.RColors.grayColor, .left, "loading...")
    var statusLabel      = UILabel(Resources.RFonts.helveticaBold15, .white, .center, "Waiting for status...")
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter.viewDidLoaded()
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
    
    func configureView() {
        guard let item = presenter.item else { return }
        self.cameraNameLabel.text  = "Camera: \(item.camera?.name?.rawValue ?? "loading error")"
        self.roverNameLabel.text   = "Rover: \(item.rover?.name?.rawValue ?? "loading error")"
        self.earthDateLabel.text   = "Earth date: \(item.earthDate ?? "loading error")"
        self.landingDateLabel.text = "Landing date: \(item.rover?.landingDate ?? "loading error")"
        self.statusLabel.text      = "STATUS: \(item.rover?.status?.rawValue.uppercased() ?? "FAIL")"
    }
}


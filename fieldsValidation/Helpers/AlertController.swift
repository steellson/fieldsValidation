//
//  AlertController.swift
//
//  Created by Steellson
//

import UIKit

//MARK: - AlertControllerProtocol

protocol AlertControllerProtocol: AnyObject {
    var header            : String? { get set }
    var message           : String? { get set }
    var actionPossibility : Bool { get set }
}


//MARK: - AlertController

final class AlertController: UIViewController {
    
    //MARK: Variables
    
    private let alertContainer = UIView()
    private var alertTitle     = UILabel()
    private let titleElement   = UIView()
    private var alertMessage   = UILabel()
    
    private let buttonSection  = UIStackView()
    private let okButton       = UIButton()
    private let cancelButton   = UIButton()
    
    
    //MARK: - Init
    
    init(header: String?, message: String?, actionPossibility: Bool = false) {
        super.init(nibName: nil, bundle: nil)
        self.header            = header
        self.message           = message
        self.actionPossibility = actionPossibility
        
        modalTransitionStyle   = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    //MARK: - Setup Methods

    private func setupAlertContainer() {
        alertContainer.backgroundColor   = Resources.RColors.purpleDirtyColor
        alertContainer.layer.borderWidth = 2
        alertContainer.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        alertContainer.squadShadow()
        alertContainer.addSubview(alertTitle)
        alertContainer.addSubview(titleElement)
        alertContainer.addSubview(alertMessage)
        
        titleElement.backgroundColor = Resources.RColors.blueDarkColor
        titleElement.squadShadow()
        
        setupAlertTextCongifuration()
        
        view.addSubview(alertContainer)
    }
    
    private func setupAlertTextCongifuration() {
        alertTitle.font            = Resources.RFonts.helveticaBold28
        alertTitle.textColor       = Resources.RColors.blueDarkColor
        alertTitle.textAlignment   = .left
        alertTitle.numberOfLines   = 1
        
        alertMessage.font          = Resources.RFonts.helvetica20
        alertMessage.textColor     = Resources.RColors.purpleBlueDirtyColor
        alertMessage.textAlignment = .left
        alertMessage.numberOfLines = 0
    }
    
    private func setupButtonSection() {
        buttonSection.backgroundColor   = Resources.RColors.purpleDirtyColor
        buttonSection.layer.borderWidth = 2
        buttonSection.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        buttonSection.axis              = .vertical
        buttonSection.distribution      = .fillEqually
        buttonSection.squadShadow()
        buttonSection.addArrangedSubview(okButton)
        
        okButton.backgroundColor        = Resources.RColors.purpleDirtyColor
        okButton.layer.borderWidth      = 2
        okButton.layer.borderColor      = .init(red: 0, green: 0, blue: 0, alpha: 1)
        okButton.titleLabel?.font       = Resources.RFonts.helveticaBold20
        okButton.setTitle("OK!", for: .normal)
        okButton.setTitleColor(Resources.RColors.blueDarkColor, for: .normal)
        okButton.setTitleColor(Resources.RColors.purpleBlueDirtyColor, for: .highlighted)
        okButton.addTarget(self, action: #selector(okButtonAction), for: .touchUpInside)
        
        view.addSubview(buttonSection)
    }
    
    
    
    //MARK: - Actions

    @objc private func okButtonAction() {
        dismiss(animated: true)
    }
    
}


//MARK: - AlertController Extension

private extension AlertController {
    
    func setupView() {
        view.backgroundColor   = Resources.RColors.blackOpacityColor
        
        setupAlertContainer()
        setupButtonSection()
        setupLayout()
    }
    
    func setupLayout() {
        setupAlertContainerLayout()
        setupButtonSectionLayout()
    }
    
    private func setupAlertContainerLayout() {
        alertContainer.translatesAutoresizingMaskIntoConstraints = false
        alertTitle.translatesAutoresizingMaskIntoConstraints     = false
        titleElement.translatesAutoresizingMaskIntoConstraints   = false
        alertMessage .translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            alertContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            alertContainer.widthAnchor.constraint(equalToConstant: view.bounds.width - 100),
            alertContainer.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.25),
            
            alertTitle.topAnchor.constraint(equalTo: alertContainer.topAnchor, constant: 30),
            alertTitle.leftAnchor.constraint(equalTo: alertContainer.leftAnchor, constant: 30),
            alertTitle.rightAnchor.constraint(equalTo: alertContainer.rightAnchor, constant: -30),
            
            titleElement.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 12),
            titleElement.leftAnchor.constraint(equalTo: alertTitle.leftAnchor),
            titleElement.rightAnchor.constraint(equalTo: alertTitle.rightAnchor),
            titleElement.heightAnchor.constraint(equalToConstant: 2),
            
            alertMessage.topAnchor.constraint(equalTo: titleElement.bottomAnchor, constant: 30),
            alertMessage.leftAnchor.constraint(equalTo: titleElement.leftAnchor),
            alertMessage.rightAnchor.constraint(equalTo: titleElement.rightAnchor)
        ])
    }
    
    private func setupButtonSectionLayout() {
        buttonSection.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            buttonSection.topAnchor.constraint(equalTo: alertContainer.bottomAnchor),
            buttonSection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSection.widthAnchor.constraint(equalToConstant: view.bounds.width - 100),
            buttonSection.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05)
        ])
    }
}


//MARK: - AlertControllerProtocol Extension

extension AlertController: AlertControllerProtocol {
    
    var header  : String? {
        get {
            return alertTitle.text ?? ""
        }
        
        set {
            alertTitle.text = newValue
        }
    }
    
    var message : String? {
        get {
            return alertMessage.text ?? ""
        }
        
        set {
            alertMessage.text = newValue
        }
    }
    
    var actionPossibility: Bool {
        get {
            return buttonSection.isHidden
        }
        
        set {
            buttonSection.isHidden = !newValue
        }
    }
}

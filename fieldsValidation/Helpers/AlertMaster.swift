//
//  AlertMaster.swift
//  Created by Steellson
//

import UIKit


//MARK: - AlertMaster

final class AlertMaster {
    
    
    //MARK: - Variables
    
    weak private var view: UIViewController?
    
//MARK: - Init
    
    init(view: UIViewController) {
        self.view = view
    }
}

//MARK: - AlertMaster Methods Extension

extension AlertMaster {
    
    func showAlert(with alertTitle: String, alertMessage: String, actionTitle: String) {
        
        let alert  = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        alert.addAction(action)
        
        view?.present(alert, animated: true)
    }
}

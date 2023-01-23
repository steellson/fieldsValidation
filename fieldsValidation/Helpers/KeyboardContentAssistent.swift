//
//  KeyboardContentPusher.swift
//
//  Created by Steellson


import UIKit


//MARK: - KeyboardContentPusher

final class KeyboardContentPusher {
        
    //MARK: - Variables
    
    var observedView   : UIView?
    var pushMultiplier : CGFloat?
    
//MARK: - Init
    
    init(observedView: UIView?, pushMultiplier: CGFloat? = 2) {
        self.observedView   = observedView
        self.pushMultiplier = pushMultiplier
    }
    
    
//MARK: - Methods

    func activateObserve() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    

    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let view = observedView else { return }
        guard let pushMultiplier = pushMultiplier else { return }
        
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight.height / pushMultiplier
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let view = observedView else { return }
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

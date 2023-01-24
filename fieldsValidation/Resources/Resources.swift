//
//  Resources.swift
//  Created by Steellson
//

import UIKit



//MARK: - All Resources

enum Resources {
    
    //MARK: - Colors
    
    enum RColors {
        static let defaultTextFieldGrayColor  = CGColor(red: 157/255, green: 159/255, blue: 159/255, alpha: 1)
        static let registrationFieldGrayColor = CGColor(red: 203/255, green: 232/255, blue: 182/255, alpha: 1)
        
        static let defaultBackgroundColor     = UIColor(red: 142/255, green: 145/255, blue: 203/255, alpha: 1)
        static let validationLabelColor       = UIColor(red: 56/255, green: 2/255, blue: 218/255, alpha: 1)
        static let validLabelColor            = UIColor(red: 6/255, green: 230/255, blue: 252/255, alpha: 1)
        static let invalidLabelColor          = UIColor(red: 185/255, green: 0, blue: 25/255, alpha: 1)
    }
    
    
    //MARK: - Images
    
    enum RImages {
        static let unicornImage = UIImage(named: "unicorn")!
    }
    
    
    
    //MARK: - Fonts
    
    enum RFonts {
        static let helveticaBold40 = UIFont(name: "Helvetica-Bold", size: 40)!
        static let helveticaBold15 = UIFont(name: "Helvetica-Bold", size: 15)!
    }
    
    
    //MARK: - Strings
    
    enum Strings: String {
        case registrationWrongAlertTitle       = "Oh no!"
        case registrationWrongAlertMessage     = "Please, check all fields again :-}"
        case registrationTryAgainAction        = "Try again!"
        case registrationCompletedAlertMessage = "Successfully completed *_*"
        case registrationCompletedActionTItle  = "Continue"

        case loginSuccessAlertTitle        = "Success! ^_^"
        
    }
    
}


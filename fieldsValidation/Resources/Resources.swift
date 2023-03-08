//
//  Resources.swift
//  Created by Steellson
//

import UIKit



//MARK: - All Resources

enum Resources {
    
    //MARK: - Cells Id
    
    enum RCellsId: String {
        case homeCollectionViewCellId
    }
    
    //MARK: - Colors
    
    enum RColors {
        
        static let purpleMainColor      = UIColor(red: 142/255, green: 145/255, blue: 203/255, alpha: 1)
        static let purpleDeepColor      = UIColor(red: 56/255, green: 2/255, blue: 218/255, alpha: 1)
        static let purpleDirtyColor     = UIColor(red: 141/255, green: 140/255, blue: 203/255, alpha: 1)
        static let purpleBlueDirtyColor = UIColor(red: 61/225, green: 52/225, blue: 112/225, alpha: 1)

        static let blueLightColor       = UIColor(red: 6/255, green: 230/255, blue: 252/255, alpha: 1)
        static let blueDarkColor        = UIColor(red: 0, green: 0, blue: 161/225, alpha: 1)

        static let redDarkColor         = UIColor(red: 151/255, green: 0, blue: 25/255, alpha: 0.7)
        
        static let saladColor           = UIColor(red: 203/255, green: 232/255, blue: 182/255, alpha: 1)

        static let grayColor            = UIColor(red: 157/255, green: 159/255, blue: 159/255, alpha: 1)
        static let blackOpacityColor    = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)

    }
    
   
    //MARK: - Images
    
    enum RImages {
        static let unicornImage = UIImage(named: "unicorn")!
    }
    
    
    
    //MARK: - Fonts
    
    enum RFonts {
        static let helvetica15 = UIFont(name: "Helvetica", size: 15)!
        static let helvetica20 = UIFont(name: "Helvetica", size: 20)!
        
        static let helveticaBold15 = UIFont(name: "Helvetica-Bold", size: 15)!
        static let helveticaBold20 = UIFont(name: "Helvetica-Bold", size: 20)!
        static let helveticaBold28 = UIFont(name: "Helvetica-Bold", size: 28)!
        static let helveticaBold40 = UIFont(name: "Helvetica-Bold", size: 40)!
    }
    
    
    //MARK: - Strings
    
    enum Strings: String {
        case registrationWrongAlertTitle       = "Oh no!"
        case registrationWrongAlertMessage     = "Please, check all fields again :]"
        case registrationTryAgainAction        = "Try again!"
        case registrationCompletedAlertMessage = "Successfully completed *_*"
        case registrationCompletedActionTItle  = "Continue"

        case loginSuccessAlertTitle        = "Success! ^_^"
        case loginAlertUserNotFoundTitle   = "Ooops!"
        case loginAlertUserNotFound        = "User is not found :'("
        case loginAlertWrongMailOrPass     = "Wrong mail or password..."
    }
    
    
    //MARK: - URL's
    
    enum RURLs: String {
        case tempURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&page=2&api_key=MqLemK0jlboyscMMHnqpsCYHC1AwJI915p87A0uV"
    }
}


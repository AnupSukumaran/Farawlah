//
//  SASCustomAlertView.swift
//  Dado_App
//
//  Created by Manu Puthoor on 04/03/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    static func showAlert(title: String, message: String, buttonTitle: String, selfClass: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        
        selfClass.present(alert, animated: true, completion: nil)
        
    }
    
    static func showAlertWithComBLK(title: String, message: String, buttonTitle: String, selfClass: UIViewController, comBLK: @escaping() -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { (_) in
            comBLK()
        }
        
        
        alert.addAction(action)
        
        selfClass.present(alert, animated: true, completion: nil)
        
    }
    
    static func showAlertWithYesOrNo(title: String, message: String, selfClass: UIViewController, comBLK: @escaping(_ state:Bool,_ alert: UIAlertController) -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            comBLK(true,alert)
        }
        
        let noAction = UIAlertAction(title: "No", style: .default) { (_) in
            comBLK(false,alert)
        }

        alert.addAction(yesAction)
        alert.addAction(noAction)
        selfClass.present(alert, animated: true, completion: nil)
        
    }
    
    static func alertForAppVersion(title: String, message: String, selfClass: UIViewController,yesBtnTitle: String, noBtnTitle: String ,comBLK: @escaping(_ state:Bool) -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: yesBtnTitle, style: .default) { (_) in
            comBLK(true)
        }
        
        let noAction = UIAlertAction(title: noBtnTitle, style: .default) { (_) in
            comBLK(false)
        }

        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        
        selfClass.present(alert, animated: true, completion: nil)
        
    }
}


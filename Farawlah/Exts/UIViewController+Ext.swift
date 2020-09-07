//
//  UIViewController+Ext.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit
import SASLoaderPod

extension UIViewController {
    
    static let loader: (UIViewController) -> (LoaderView) = { (vc) in
        return LoaderView(callOn: vc, type: .lineScale, color: .red, padding: 18)
    }
    
    func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    func callMainViewController(forLoginPage: Bool) {
        guard let vc = mainStoryboard().instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else {fatalError("MainViewController not found")}
        forLoginPage ?
            (vc.loginViewModel = LoginViewModel(loader: UIViewController.loader(vc))) :
            (vc.registerViewModel = RegisterViewModel(loader: UIViewController.loader(vc)))
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    func showAnimate() {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
      
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion:{(finished : Bool)  in
            if (finished) {
                self.view.removeFromSuperview()
            }
        })
    }
}


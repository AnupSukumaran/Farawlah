//
//  UIViewController+Ext.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func moveToTextViewPopUpViewController() {
        if let popOverVC = mainStoryboard().instantiateViewController(withIdentifier: PopUpViewController.identifier) as? PopUpViewController {
            addChild(popOverVC)
            view.addSubview(popOverVC.view)
            popOverVC.view.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
            popOverVC.didMove(toParent: self)
        }
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


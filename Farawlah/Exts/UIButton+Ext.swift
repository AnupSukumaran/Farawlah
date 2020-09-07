//
//  UIButton+Ext.swift
//  Farawlah
//
//  Created by Manu Puthoor on 07/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

extension UIView {
    func bounce() {
         UIButton.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.875, y: 0.86)
         }, completion: { finish in
           UIButton.animate(withDuration: 0.2, animations: {
                 self.transform = CGAffineTransform.identity
           })
         })
     }
}

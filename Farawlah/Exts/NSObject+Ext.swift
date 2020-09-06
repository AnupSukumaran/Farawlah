//
//  NSObject+Ext.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    
}

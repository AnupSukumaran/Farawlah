//
//  LoginViewModel.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 07/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {
    var viewHeight: CGFloat = 0
    override init() {}
}

extension LoginViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewCell.identifier, for: indexPath) as? LoginTableViewCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

//
//  LoginViewModel.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 07/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit
import SASLoaderPod
import SASValidatorPack

class LoginViewModel: NSObject {
    var viewHeight: CGFloat = 0
    
    var newUserSignUpBtnActionHandler:(() -> ())?
    //var loginBtnActionHandler: (() -> ())?
    var forgotBtnActionHandler: (() ->())?
    var facebookActionHandler: (() -> ())?
    var googleActionHandler: (() -> ())?
     var validation: ((_ success: Bool) -> ())?
    var loginSuccess: (() -> ())?
    var loader: LoaderView!
    
    override init() {}
     init(loader: LoaderView) {
        self.loader = loader
    }
}

extension LoginViewModel {
    func callingLoginAPI() {
        loader.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loader.stopAnimating()
            let userData = UserModel(userid: 5567434, rolename: "admin", roleid: 22, emailAddress: "admin@g.com")
            guard let userID = userData.userid else {return}
            UserDefaults.standard.set(userID, forKey: .kSession)
            self.loginSuccess?()
            
        }
    }
    
    
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
            
            cell.viewModel = self
            cell.newUserSignUpBtnActionHandler = newUserSignUpBtnActionHandler
            //cell.loginBtnActionHandler = loginBtnActionHandler
            cell.forgotBtnActionHandler = forgotBtnActionHandler
            cell.facebookActionHandler = facebookActionHandler
            cell.googleActionHandler = googleActionHandler
            cell.validation = validation
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension LoginViewModel: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


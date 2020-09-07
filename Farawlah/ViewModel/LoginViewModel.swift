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
    var newUserSignUpBtnActionHandler:(() -> ())?
    var forgotBtnActionHandler: (() ->())?
    var facebookActionHandler: (() -> ())?
    var googleActionHandler: (() -> ())?
    var validation: ((_ success: Bool) -> ())?
    var loginSuccess: (() -> ())?
    var loader: LoaderView!
    var errorHandler: ((_ err: String) -> ())?
    var userData: UserModel?
    
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
            if let localData = self.readLocalFile(forName: "UserInfo") {
                
                self.parse(jsonData: localData) { (response) in
                    switch response {
                    case .success(let data):
                        self.userData = data.userData
                        guard let userID = self.userData?.userId else {return}
                        UserDefaults.standard.set(userID, forKey: .kSession)
                        self.loginSuccess?()
                    
                    case .failure(errorStr: let errStr):
                        self.errorHandler?(errStr)
                        
                    }
                }
            }
        
        }
    }
    
    
}

extension LoginViewModel: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewCell.identifier, for: indexPath) as? LoginTableViewCell {
            
            cell.viewModel = self
            cell.newUserSignUpBtnActionHandler = newUserSignUpBtnActionHandler
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


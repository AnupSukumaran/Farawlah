//
//  RegisterViewModel.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 07/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASLoaderPod
import SASValidatorPack

class RegisterViewModel: NSObject {
    var loader: LoaderView!
    var gobackToLoginBtnnHandler:(() -> ())?
    var forgotBtnActionHandler: (() ->())?
    var facebookActionHandler: (() -> ())?
    var googleActionHandler: (() -> ())?
    var validation: ((_ success: Bool) -> ())?
    var registrationSuccess: (() -> ())?
    
    
    override init() {}
    
     init(loader: LoaderView) {
        self.loader = loader
    }
}

extension RegisterViewModel {
    func callingRegistrationAPI() {
        loader.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loader.stopAnimating()
          //  let userData = UserModel(userid: 5567434, rolename: "admin", roleid: 22, emailAddress: "admin@g.com")
//            guard let userID = userData.userid else {return}
//            UserDefaults.standard.set(userID, forKey: .kSession)
            self.registrationSuccess?()
            
        }
    }
    
    
}


extension RegisterViewModel: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier, for: indexPath) as? RegisterTableViewCell {
            
            cell.viewModel = self
            cell.gobackToLoginBtnnHandler = gobackToLoginBtnnHandler
            cell.facebookActionHandler = facebookActionHandler
            cell.googleActionHandler = googleActionHandler
            cell.validation = validation
            cell.registrationSuccess = registrationSuccess
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension RegisterViewModel: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//
//  LoginTableViewCell.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class LoginTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var loginLb: UILabel!
    @IBOutlet weak var newUserSignUpBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    
    var textFields = [UITextField]()
    
    var newUserSignUpBtnActionHandler:(() -> ())?
    var loginBtnActionHandler: (() -> ())?
    var forgotBtnActionHandler: (() ->())?
    var facebookActionHandler: (() -> ())?
    var googleActionHandler: (() -> ())?
    
    var viewModel: LoginViewModel! {
        didSet {
            textFields.forEach{$0.delegate = viewModel}
            viewModel.newUserSignUpBtnActionHandler = newUserSignUpBtnActionHandler
            viewModel.loginBtnActionHandler = loginBtnActionHandler
            viewModel.forgotBtnActionHandler = forgotBtnActionHandler
            viewModel.facebookActionHandler = facebookActionHandler
            viewModel.googleActionHandler = googleActionHandler
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textFields = [emailTxtField, passwordTxtField]
    }
  
    @IBAction func newUserSignUpBtnAction(_ sender: UIButton) {
        newUserSignUpBtnActionHandler?()
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        loginBtnActionHandler?()
    }
    
    @IBAction func forgotBtnAction(_ sender: UIButton) {
        forgotBtnActionHandler?()
    }
    
    @IBAction func facebookBtnAction(_ sender: UIButton) {
        facebookActionHandler?()
    }
    
    @IBAction func googleBtnAction(_ sender: UIButton) {
        googleActionHandler?()
    }
    
    
}

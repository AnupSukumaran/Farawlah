//
//  LoginTableViewCell.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASValidatorPack

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
    @IBOutlet weak var loginBtnBaseView: UIViewCustom!
    
    var textFields = [UITextField]()
    var sasValidator: SASValidator?
    var newUserSignUpBtnActionHandler:(() -> ())?
    var forgotBtnActionHandler: (() ->())?
    var facebookActionHandler: (() -> ())?
    var googleActionHandler: (() -> ())?
    var validation: ((_ success: Bool) -> ())?
    
    var viewModel: LoginViewModel! {
        didSet {
            textFields.forEach{$0.delegate = viewModel}
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textFields = [emailTxtField, passwordTxtField]
        sasValidator = SASValidator(delegate: self, textfields: textFields)
    }
  
    @IBAction func newUserSignUpBtnAction(_ sender: UIButton) {
        newUserSignUpBtnActionHandler?()
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        loginBtnBaseView.bounce()
        textFields.forEach{$0.resignFirstResponder()}
        sasValidator?.setValidator()
    }
    
    @IBAction func forgotBtnAction(_ sender: UIButton) {
        forgotBtnActionHandler?()
    }
    
    @IBAction func facebookBtnAction(_ sender: UIButton) {
        sender.bounce()
        facebookActionHandler?()
    }
    
    @IBAction func googleBtnAction(_ sender: UIButton) {
        sender.bounce()
        googleActionHandler?()
    }
    
    
}

extension LoginTableViewCell: SASValidatorDelegate {
    func setValidatorAndRulesForTextFields(_ validator: Validator) {
        
        validator.registerField(emailTxtField, rules: [RequiredRule(message: "Please enter your email address"), EmailRule(message: "Email address not valid")])

        validator.registerField(passwordTxtField, rules: [RequiredRule(message: "Please enter your password"), PasswordRule(message: "Password must have 8 characters with first letter caps")])
        
    }
    
    func validationSuccessful() {
        validation?(true)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
       // print("errors = \(errors.map{$0.1.errorMessage})")
        validation?(false)
    }
    
    
}

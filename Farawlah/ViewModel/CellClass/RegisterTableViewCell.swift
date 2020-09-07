//
//  RegisterTableViewCell.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASValidatorPack

class RegisterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var SignUpLb: UILabel!
    @IBOutlet weak var gobackToLoginBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var radioBtnImgView: UIImageView!
    @IBOutlet weak var acceptTermAndConBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var signUpLB: UILabel!
    
    var textFields = [UITextField]()
    var sasValidator: SASValidator?
    
    var gobackToLoginBtnnHandler:(() -> ())?
    var facebookActionHandler: (() -> ())?
    var googleActionHandler: (() -> ())?
    var validation: ((_ success: Bool) -> ())?
    var registrationSuccess: (() -> ())?
    
    var viewModel: RegisterViewModel! {
        didSet {
            textFields.forEach{$0.delegate = viewModel}
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textFields = [emailTxtField, passwordTxtField, phoneNumTxtField]
        sasValidator = SASValidator(delegate: self, textfields: textFields)
    }

    @IBAction func gobackToLoginBtnnAction(_ sender: UIButton) {
        gobackToLoginBtnnHandler?()
    }
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        textFields.forEach{$0.resignFirstResponder()}
        sasValidator?.setValidator()
    }
    
    @IBAction func acceptTermAndConBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        radioBtnImgView.image = sender.isSelected ? UIImage(named: "selected") : UIImage(named: "notselected")
        signUpBtn.isEnabled = sender.isSelected
        signUpLB.textColor = sender.isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    @IBAction func facebookBtnAction(_ sender: UIButton) {
        facebookActionHandler?()
    }
    
    @IBAction func googleBtnAction(_ sender: UIButton) {
        googleActionHandler?()
    }

}

extension RegisterTableViewCell: SASValidatorDelegate {
    func setValidatorAndRulesForTextFields(_ validator: Validator) {
        
        validator.registerField(emailTxtField, rules: [RequiredRule(message: "Please enter your email address"), EmailRule(message: "Email address not valid")])

        validator.registerField(passwordTxtField, rules: [RequiredRule(message: "Please enter your password"), PasswordRule(message: "Password must have 8 characters with first letter caps")])
        
        validator.registerField(phoneNumTxtField, rules: [RequiredRule(message: "Please enter your phone number.")])
        
    }
    
    func validationSuccessful() {
        validation?(true)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
       // print("errors = \(errors.map{$0.1.errorMessage})")
        validation?(false)
    }
    
    
}

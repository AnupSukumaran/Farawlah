//
//  MainViewController.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASKeyboardPack

class MainViewController: UIViewController {
    
    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var addItemsBtn: UIBarButtonItem!
    @IBOutlet var tapGest: UITapGestureRecognizer!
       
    
    var listViewModel: ListViewModel! {
        didSet {
            handlersForViewModel()
        }
    }
    
    var loginViewModel: LoginViewModel! {
        didSet {
            handlersForLoginViewModel()
        }
    }
    
    var registerViewModel: RegisterViewModel! {
        didSet {
            handlersForRegisterViewModel()
        }
    }
   
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        listViewModel?.clearSession()
    }
    
}

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModels()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listViewModel?.checkUserInSession()
    }

}

extension MainViewController {
    
    func setUpViewModels() {
        configListViewModel()
        configLoginViewModel()
        configRegisterViewModel()
    }
    
    func configListViewModel() {
        guard let li = listViewModel else { return }
        listView.delegate = li
        listView.dataSource = li
        listView.rowHeight = UITableView.automaticDimension
        listView.estimatedRowHeight = 53
        navigationController?.navigationBar.isHidden = false
    }
    
    func configLoginViewModel() {
        guard let li = loginViewModel else { return }
        listView.delegate = li
        listView.dataSource = li
        li.viewHeight = listView.frame.height
        KeyBrd().scrollAdjustment(listView, top: -64)
        KeyBrd().regKBNotific(listView, 120)
        navigationController?.navigationBar.isHidden = true
    }
    
    func configRegisterViewModel() {
       guard let li = registerViewModel else { return }
       listView.delegate = li
       listView.dataSource = li
       li.viewHeight = listView.frame.height
       KeyBrd().scrollAdjustment(listView, top: -64)
       KeyBrd().regKBNotific(listView, 120)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    /// This function give actions to all the handers from ListViewModel
    func handlersForViewModel(){
        listViewModel.popUpControllerHandler = { [weak self] alertVC in
            self?.present(alertVC, animated: true, completion: nil)
        }
        
        listViewModel.tableViewReloadHandler = { [weak self]  in
            self?.listView.reloadData()
        }
        
        listViewModel.itemDuplicationAlertHandler = { [weak self]  in
            guard let vc = self else {return}
            UIAlertController.showAlert(title: .appName, message: .message, buttonTitle: .ok, selfClass: vc)
        }
        
        listViewModel.loginVCHandler = { [weak self] in
            self?.callMainViewController(forLoginPage: true, animated: false)
        }
    }
    
    /// This function give actions to all the handers from LoginViewModel
    func handlersForLoginViewModel() {
        
        loginViewModel.newUserSignUpBtnActionHandler = {[weak self] in
            self?.callMainViewController(forLoginPage: false, animated: true)
        }

        loginViewModel.forgotBtnActionHandler = {}
        
        loginViewModel.facebookActionHandler = {}

        loginViewModel.googleActionHandler = {}
        
        loginViewModel.validation = { [weak self] success in
            guard let vc = self else {return}
            success ?
            (self?.loginViewModel.callingLoginAPI()) :
            (UIAlertController.showAlert(title: .appName, message: .credentialMsg, buttonTitle: .ok, selfClass: vc))
        }
        
        loginViewModel.loginSuccess = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func handlersForRegisterViewModel() {
        
        registerViewModel.gobackToLoginBtnnHandler = { [weak self] in
            guard let vc = self else {return}
            vc.navigationController?.popViewController(animated: true)
        }

        registerViewModel.forgotBtnActionHandler = {}
        
        registerViewModel.facebookActionHandler = {}

        registerViewModel.googleActionHandler = {}
        
        registerViewModel.validation = { [weak self] success in
            guard let vc = self else {return}
            success ?
            (self?.registerViewModel.callingRegistrationAPI()) :
            (UIAlertController.showAlert(title: .appName, message: .credentialMsg, buttonTitle: .ok, selfClass: vc))
        }
        
        registerViewModel.registrationSuccess = {  [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
}

extension MainViewController {
    
    @IBAction func addItemBtnAction(_ sender: UIBarButtonItem) {
        listViewModel?.popUpController()
        //moveToTextViewPopUpViewController()
    }
    
    
    
}

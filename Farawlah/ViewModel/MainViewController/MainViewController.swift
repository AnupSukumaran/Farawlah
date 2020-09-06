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
    
    var listViewModel: ListViewModel! {
        didSet {
            handlersForViewModel()
        }
    }
    
    var loginViewModel: LoginViewModel! {
        didSet {
            
        }
    }
    @IBOutlet var tapGest: UITapGestureRecognizer!
    
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModels()
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
    }
    
    func configListViewModel() {
        guard let li = listViewModel else { return }
        listView.delegate = li
        listView.dataSource = li
        listView.rowHeight = UITableView.automaticDimension
        listView.estimatedRowHeight = 53
    }
    
    func configLoginViewModel() {
        guard let li = loginViewModel else { return }
        listView.delegate = li
        listView.dataSource = li
        li.viewHeight = listView.frame.height
        KeyBrd().scrollAdjustment(listView, top: -64)
        KeyBrd().regKBNotific(listView, 120)
    }
    
    
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
            self?.callMainViewController()
        }
    }
    
}

extension MainViewController {
    
    @IBAction func addItemBtnAction(_ sender: UIBarButtonItem) {
        listViewModel?.popUpController()
        //moveToTextViewPopUpViewController()
    }
    
    
    
}

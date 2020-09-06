//
//  MainViewController.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var addItemsBtn: UIBarButtonItem!
    
    var listViewModel: ListViewModel! {
        didSet {
            handlersForViewModel()
        }
    }
}

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModels()
    }

}

extension MainViewController {
    
    func setUpViewModels() {
        configListViewModel()
    }
    
    func configListViewModel() {
        guard let li = listViewModel else { return }
        listView.delegate = li
        listView.dataSource = li
        listView.rowHeight = UITableView.automaticDimension
        listView.estimatedRowHeight = 53
    }
    
    func handlersForViewModel(){
        listViewModel.popUpControllerHandler = { [weak self] alertVC in
            self?.present(alertVC, animated: true, completion: nil)
        }
    }
    
}

extension MainViewController {
    
    @IBAction func addItemBtnAction(_ sender: UIBarButtonItem) {
        //listViewModel?.popUpController()
        moveToTextViewPopUpViewController()
    }
    
}

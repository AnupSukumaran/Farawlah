//
//  ListViewModel.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit


class ListViewModel: NSObject {
    var itemsArr = [String]()
    var popUpControllerHandler: ((_ alertController: UIAlertController) -> ())?
    var tableViewReloadHandler: (() -> ())?
    var itemDuplicationAlertHandler: (() -> ())?
    var loginVCHandler: (() -> ())?
    
    override init() {}

}

extension ListViewModel {
    
    
    /// This function checks if the user is logged in
    func checkUserInSession() {
        guard let userID = UserDefaults.standard.value(forKey: .kSession) else {
            self.loginVCHandler?()
            return
        }
        
        switch userID {
        case is Int:
            print("Id is Int")
        case is String:
            print("Id is String")
        default:
            break
        }
    
    }
    
    /// This function is used to logout and clear the session.
    func clearSession() {
        UserDefaults.standard.removeObject(forKey: .kSession)
         self.loginVCHandler?()
    }
    
    // AlertViewController with UITextFields
    func popUpController() {

        let alertController = UIAlertController(title: "Add new item", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Item"
        }
        
        let saveAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { [unowned self] alert -> Void in
            let txt = alertController.textFields![0] as UITextField
            guard let str = txt.text else {return}
            guard !self.itemsArr.contains(str) else {self.itemDuplicationAlertHandler?();return}
            self.itemsArr.append(str)
            self.itemsArr = self.itemsArr.sorted(by: <)
            self.tableViewReloadHandler?()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        popUpControllerHandler?(alertController)
    
    }
}

/// UITableView protocol confirmations
extension ListViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell {
            cell.itemlabel.text = itemsArr[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    
}

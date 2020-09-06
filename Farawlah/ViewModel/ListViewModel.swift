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
    override init() {}

}

extension ListViewModel {
    
    func popUpController() {

        let alertController = UIAlertController(title: "Farawlah", message: nil, preferredStyle: UIAlertController.Style.alert)

        let margin:CGFloat = 8.0
        let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0)
        let customView = UITextView(frame: rect)

        customView.backgroundColor = UIColor.clear
        customView.font = UIFont(name: "Helvetica", size: 15)



        //  customView.backgroundColor = UIColor.greenColor()
        alertController.view.addSubview(customView)

        let somethingAction = UIAlertAction(title: "Something", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in print("something")

            print(customView.text ?? "-nion-")

        })

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {(alert: UIAlertAction!) in print("cancel")})

        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        popUpControllerHandler?(alertController)
        
       // self.present(alertController, animated: true, completion:{})


    }
}

extension ListViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell {
            cell.itemlabel.text = ""
            return cell
        }
        return UITableViewCell()
    }
    
    
}

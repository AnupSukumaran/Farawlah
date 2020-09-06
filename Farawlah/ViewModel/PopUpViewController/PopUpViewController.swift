//
//  PopUpViewController.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 06/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var txtView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        showAnimate()
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
        removeAnimate()
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        removeAnimate()
    }
    
}

//
//  LoadingChildViewController.swift
//  OverlayActivityIndicator
//
//  Created by Manu Puthoor on 06/04/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit

public class LoadingChildViewController: UIViewController {
    
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    
    @IBOutlet weak var indicatorBaseView: UIView!
    
    var indicator: NVActivityIndicatorView!
    var type:  NVActivityIndicatorType = .ballRotate
    var color: UIColor = .red
    var padding: CGFloat = 5
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: indicatorBaseView.frame.width, height: indicatorBaseView.frame.height)
        indicator = NVActivityIndicatorView(frame: frame, type: type, color: color, padding: padding)
        indicator.startAnimating()
        indicatorBaseView.addSubview(indicator)
       
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        indicator.stopAnimating()
    }

}

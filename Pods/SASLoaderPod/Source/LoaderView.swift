//
//  LoaderView.swift
//  OverlayActivityIndicator
//
//  Created by Manu Puthoor on 06/04/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit

public class LoaderView: UIStoryboard {
    
    var loaderView: LoadingChildViewController?
    
    var calledOnViewController: UIViewController?
    
    var type:  NVActivityIndicatorType = .ballRotate
    var color: UIColor = .red
    var padding: CGFloat = 5
    var viewCalled = false
    public func mainStoryboard() -> UIStoryboard {
        let bundle = Bundle(identifier: "org.cocoapods.SASLoaderPod")
        return UIStoryboard(name: "Main", bundle: bundle)
    }

    public func loadingChildViewController() -> LoadingChildViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "LoadingChildViewController") as? LoadingChildViewController
    }
    
    public init(callOn: UIViewController, type: NVActivityIndicatorType = .ballRotate,color: UIColor = .red,padding: CGFloat = 5) {
        calledOnViewController = callOn
        self.type = type
        self.color = color
        self.padding = padding
        
    }
   
    public func startAnimating() {
        guard !viewCalled else {return}
        viewCalled = true
        guard let vc = calledOnViewController else {return}
        loaderView = setUpLoader(callOn: vc, type: type,color: color,padding: padding)
    }
    
    public func stopAnimating() {
        viewCalled = false
        removeChild(removeChildView: loaderView)
    }
    
    public func setUpLoader(callOn: UIViewController, type: NVActivityIndicatorType = .ballRotate,color: UIColor = .red,padding: CGFloat = 5) -> LoadingChildViewController? {
        guard let vc = loadingChildViewController() else {return nil}
        vc.modalPresentationStyle = .fullScreen
        vc.type = type
        vc.color = color
        vc.padding = padding
        callOn.view.addSubview(vc.view)
        callOn.addChild(vc)
        vc.didMove(toParent:  callOn)
        vc.view.frame = callOn.view.frame
        return vc
    }
    
    public func removeChild(removeChildView: UIViewController?) {
        guard let main = removeChildView else {return}
        main.willMove(toParent: nil)
        main.view.removeFromSuperview()
        main.removeFromParent()
    }
    
    public func activityOnAlert(callOn: UIViewController, loadingMsg: String = "Please wait ...") {
        let alert = UIAlertController(title: nil, message: loadingMsg, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
      
    
        if #available(iOS 13.0, *) {
            loadingIndicator.style = .medium
        } else {
            loadingIndicator.style = UIActivityIndicatorView.Style.gray
        }
    
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        
        callOn.present(alert, animated: true, completion: nil)
    }
    
   public func dismissActivityOnAlert(removeFrom: UIViewController) {
        removeFrom.dismiss(animated: true, completion: nil)
    }
}

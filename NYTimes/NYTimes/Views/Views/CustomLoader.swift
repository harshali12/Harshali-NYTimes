//
//  CustomLoader.swift
//  NYTimes
//
//  Created by APPLE on 22/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
import UIKit
class CustomLoader: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    class func instanceFromNib() -> CustomLoader {
        return UINib(nibName: "CustomLoader", bundle: nil).instantiate(withOwner: nil,options: nil)[0] as! CustomLoader
    }
    
    static  func showActivityView(view:UIView){
        DispatchQueue.main.async {
            let activityView = CustomLoader.instanceFromNib()
            activityView.frame.size = CGSize(width: view.frame.size.width, height: 50)
            let window:UIWindow = ((UIApplication.shared.delegate?.window)!)!
            activityView.center = CGPoint(x: window.center.x, y: window.center.y-50)
            view.addSubview(activityView)
            view.bringSubviewToFront(activityView)
            activityView.tag = 5551
            activityView.activityIndicator.hidesWhenStopped = true
            activityView.activityIndicator.color = UIColor.black
            activityView.activityIndicator.isHidden = false
            activityView.activityIndicator.startAnimating()
        }
        
    }
    
    static func removeActivityIndicator(_ view:UIView){
        DispatchQueue.main.async {
            for subView in view.subviews {
                if let myActivityView = subView.viewWithTag(5551) as? CustomLoader {
                    myActivityView.activityIndicator.stopAnimating()
                    myActivityView.removeFromSuperview()
                }
            }
        }
    }
    
}

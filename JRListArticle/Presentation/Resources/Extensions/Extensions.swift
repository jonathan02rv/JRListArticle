//
//  Extensions.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

fileprivate var atvView : UIView?

extension UIViewController{
    
    func showActivity(){
        atvView = UIView(frame: self.view.bounds)
        guard let _ = atvView else{return}
        atvView!.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        var atvIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            atvIndicator = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            atvIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        atvIndicator.color = .black
        atvIndicator.center = atvView!.center
        atvIndicator.startAnimating()
        atvView!.addSubview(atvIndicator)
        self.view.addSubview(atvView!)
    }
    
    func hideActivity(){
        atvView?.removeFromSuperview()
        atvView = nil
    }
}

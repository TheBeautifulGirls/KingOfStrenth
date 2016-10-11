//
//  YAlertViewController.swift
//  YunVideo
//
//  Created by cll12_12 on 16/8/5.
//  Copyright © 2016年 ifdoo. All rights reserved.
//

import UIKit

class YAlertViewController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    class func showAlertController(view: UIViewController, title: String, message: String) -> YAlertViewController {
        
        let alert = YAlertViewController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "确定", style: .Default, handler: nil)
        alert.addAction(okAction)
        view.presentViewController(alert, animated: false, completion: nil)
        return alert
    }
    
    class func showAlertControllerToMenu(view: UIViewController, title: String, message: String) -> YAlertViewController {
        
        let alert = YAlertViewController(title: title, message: message, preferredStyle: .Alert)
        let vc = LoginViewController()
        let okAction = UIAlertAction(title: "确定", style: .Default) { (alerAction) in
            view.presentViewController(vc, animated: false, completion: nil)
        }
        alert.addAction(okAction)
        view.presentViewController(alert, animated: false, completion: nil)
        return alert
    }
    
    class func showAlertControllerCompleion(completionHandler:(() -> Void), view: UIViewController, title: String, message: String) -> YAlertViewController {
        let alert = YAlertViewController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "确定", style: .Default) { (alerAction) in
            completionHandler()
        }
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        view.presentViewController(alert, animated: false, completion: nil)
        
        return alert
    }
    
}

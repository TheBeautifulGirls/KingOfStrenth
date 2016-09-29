//
//  BaseViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/20.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var barView: UIImageView?
    var navTitleView: UIImageView?
    var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - event response
    func back() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - private method
    func initNavigationBar(title: String?, showLeft: Bool, showRight: Bool) {
        
        barView?.removeFromSuperview()
        navTitleView?.removeFromSuperview()
        backButton?.removeFromSuperview()
        barView = nil
        navTitleView = nil
        backButton = nil
        
        let height = 44
        barView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: CGFloat(height)))
        barView!.image = UIImage(named: "navigationbar_selfScore_icon_normal_iPhone")
        self.view.addSubview(barView!)
        
        if title != nil {
            if title == "navgationbar_Message_icon_normal_iPhone" {
                navTitleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: CGFloat(height/2)-10))
                navTitleView!.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, CGFloat(height/2)-5)
            } else {
                navTitleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: CGFloat(height/2)))
                navTitleView!.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, CGFloat(height/2))
            }
            navTitleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: CGFloat(height/2)))
            navTitleView!.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, CGFloat(height/2))
            navTitleView?.image = UIImage(named: title!)
            self.view.addSubview(navTitleView!)
        }
        if showLeft {
            backButton = UIButton(frame: CGRect(x: 10, y: 0, width: 30, height: CGFloat(height)))
            backButton?.setImage(UIImage(named: "common_back_icon_normal_iphone"), forState: .Normal)
            backButton?.addTarget(self, action: #selector(BaseViewController.back), forControlEvents: .TouchUpInside)
            self.view.addSubview(backButton!)
        }
    }
    
    // MARK: - setters and getters


}

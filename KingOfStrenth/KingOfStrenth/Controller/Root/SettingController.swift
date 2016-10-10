//
//  SettingController.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class SettingController: BaseViewController {
    
    var _tab:UITabBarController?
    
     //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar("navgationbar_setting_icon_normal_iPhone", showLeft: true, showRight: false)
        //initBaseLayout()
        _tab = UITabBarController()
        _tab!.tabBar.hidden = true
        _tab!.view.frame = CGRectMake(110,44,self.view.frame.width - 110,self.view.frame.height - 44)
        let personalVC = PersonalInformationController()
        let item1 = UITabBarItem()
        personalVC.tabBarItem = item1
        
        let systemSettingVC = SystemSettingsViewController()
        let item2 = UITabBarItem()
        systemSettingVC.tabBarItem = item2
        
        let tabArray = [personalVC,systemSettingVC]
        _tab!.viewControllers = tabArray
        
        self.addChildViewController(_tab!)
        self.view.addSubview(_tab!.view)
        

    }
    
    //MARK: - private methods
    func initBaseLayout(){
//        let personalVC = PersonalInformationController()
//        let item1 = UITabBarItem()
//        personalVC.tabBarItem = item1
//        
//        let systemSettingVC = SystemSettingsViewController()
//        let item2 = UITabBarItem()
//        systemSettingVC.tabBarItem = item2
//        
//        let tabArray = [personalVC,systemSettingVC]
//        _tab!.viewControllers = tabArray
        
        
    }
    
    func layoutPageSubViews(){
        
    }
    
    //MARK: setting and getting
//    var _tab:UITabBarController!
//    var tab:UITabBarController{
//        if _tab == nil{
//            _tab = UITabBarController()
//            _tab.tabBar.hidden = true
//            _tab.view.frame = CGRectMake(110,44,self.view.frame.width - 110,self.view.frame.height - 44)
//            
//            self.addChildViewController(_tab)
//            self.view.addSubview(_tab.view)

//        }
//        return _tab
//    }

}

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
        initBaseLayout()
        layoutPageSubViews()
        initTab()
        
    }
    
    //MARK: - private methods
    func initTab(){
        _tab = UITabBarController()
        _tab!.tabBar.hidden = true
        _tab!.view.frame = CGRectMake(110,44,self.view.frame.width - 110,self.view.frame.height - 44)
        let personalVC = PersonalInformationController()
        let item1 = UITabBarItem()
        personalVC.tabBarItem = item1
        
        let changeVersionVC = CourseViewController()
        let item2 = UITabBarItem()
        changeVersionVC.tabBarItem = item2
        
        let systemSettingVC = SystemSettingsViewController()
        let item3 = UITabBarItem()
        systemSettingVC.tabBarItem = item3
        
        let updateVersionVC = UpdateVersionViewController()
        let item4 = UITabBarItem()
        updateVersionVC.tabBarItem = item4
        
        let courseActivationVC = CourseActivationViewController()
        let item5 = UITabBarItem()
        courseActivationVC.tabBarItem = item5
        
        let tabArray = [personalVC,changeVersionVC,systemSettingVC,updateVersionVC,courseActivationVC]
        _tab!.viewControllers = tabArray
        
        self.addChildViewController(_tab!)
        self.view.addSubview(_tab!.view)
    }
    
    func initBaseLayout(){
        
        self.view.addSubview(backgroundImage)
        self.backgroundImage.addSubview(personMessageBtn)
        self.backgroundImage.addSubview(changeVersionBtn)
        self.backgroundImage.addSubview(settingBtn)
        self.backgroundImage.addSubview(updateVersionBtn)
        self.backgroundImage.addSubview(courseActivationBtn)
        initNavigationBar("navgationbar_setting_icon_normal_iPhone", showLeft: true, showRight: false)
        
    }
    
    func layoutPageSubViews(){
        
        backgroundImage.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        personMessageBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backgroundImage.snp_left).offset(3/736*WIDTH)
            make.top.equalTo(backgroundImage.snp_top).offset(80/414*HEIGHT)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        changeVersionBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backgroundImage.snp_left).offset(3/736*WIDTH)
            make.top.equalTo(personMessageBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        settingBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backgroundImage.snp_left).offset(3/736*WIDTH)
            make.top.equalTo(changeVersionBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        updateVersionBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backgroundImage.snp_left).offset(3/736*WIDTH)
            make.top.equalTo(settingBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        courseActivationBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backgroundImage.snp_left).offset(3/736*WIDTH)
            make.top.equalTo(updateVersionBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
    }
    
    //MARK: - setting and getting
    var _backgroundImage:UIImageView!
    var backgroundImage:UIImageView {
        if _backgroundImage == nil {
            _backgroundImage = UIImageView()
            _backgroundImage.userInteractionEnabled = true
            _backgroundImage.image = UIImage(named: "Archives_BackGround_icon_iPhone")
        }
        return _backgroundImage
    }
    
    var _personMessageBtn:UIButton!
    var personMessageBtn:UIButton {
        if _personMessageBtn == nil {
            _personMessageBtn = UIButton()
            _personMessageBtn.tag = 1
            _personMessageBtn.selected = true
            _personMessageBtn.setBackgroundImage(UIImage(named: "Setting_personMessage_btn_normal_iPhone"), forState: .Normal)
            _personMessageBtn.setBackgroundImage(UIImage(named: "Setting_personMessage_btn_selected_iPhone"), forState: .Selected)
            _personMessageBtn.addTarget(self, action: #selector(SettingController.changeVC(_:)), forControlEvents: .TouchUpInside)
        }
        return _personMessageBtn
    }
    
    var _changeVersionBtn:UIButton!
    var changeVersionBtn:UIButton {
        if _changeVersionBtn == nil {
            _changeVersionBtn = UIButton()
            _changeVersionBtn.tag = 2
            _changeVersionBtn.setBackgroundImage(UIImage(named: "Setting_changeVersion_btn_normal_iPhone"), forState: .Normal)
            _changeVersionBtn.setBackgroundImage(UIImage(named: "Setting_changeVersion_btn_selected_iPhone"), forState: .Selected)
            _changeVersionBtn.addTarget(self, action: #selector(SettingController.changeVC(_:)), forControlEvents: .TouchUpInside)
        }
        return _changeVersionBtn
    }
    
    var _settingBtn:UIButton!
    var settingBtn:UIButton {
        if _settingBtn == nil {
            _settingBtn = UIButton()
            _settingBtn.tag = 3
            _settingBtn.setBackgroundImage(UIImage(named: "Setting_systemSetting_btn_normal_iPhone"), forState: .Normal)
            _settingBtn.setBackgroundImage(UIImage(named: "Setting_systemSetting_btn_selected_iPhone"), forState: .Selected)
            _settingBtn.addTarget(self, action: #selector(SettingController.changeVC(_:)), forControlEvents: .TouchUpInside)
        }
        return _settingBtn
    }
    
    var _updateVersionBtn:UIButton!
    var updateVersionBtn:UIButton {
        if _updateVersionBtn == nil {
            _updateVersionBtn = UIButton()
            _updateVersionBtn.tag = 4
            _updateVersionBtn.setBackgroundImage(UIImage(named: "setting_update_btn_normal_iphone"), forState: .Normal)
            _updateVersionBtn.setBackgroundImage(UIImage(named: "Setting_update_btn_selected_iPhone"), forState: .Selected)
            _updateVersionBtn.addTarget(self, action: #selector(SettingController.changeVC(_:)), forControlEvents: .TouchUpInside)
        }
        return _updateVersionBtn
    }
    
    var _courseActivationBtn:UIButton!
    var courseActivationBtn:UIButton{
        if _courseActivationBtn == nil{
            _courseActivationBtn = UIButton()
            _courseActivationBtn.tag = 5
            _courseActivationBtn.setBackgroundImage(UIImage(named: "setting_activatecourse_btn_normal_iphone"), forState: .Normal)
            _courseActivationBtn.setBackgroundImage(UIImage(named: "setting_activatecourse_btn_selected_iphone"), forState: .Selected)
            _courseActivationBtn.addTarget(self, action: #selector(SettingController.changeVC(_:)), forControlEvents: .TouchUpInside)
        }
        return _courseActivationBtn
    }
    
    
    
    func changeVC(sender:UIButton){
        for i in [1,2,3,4,5]{
            let button = self.view.viewWithTag(i) as! UIButton
            button.selected = false
        }
        sender.selected = true
        _tab!.selectedIndex = sender.tag-1
    }

}

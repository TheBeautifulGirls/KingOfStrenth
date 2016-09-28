//
//  SettingViewController.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initBaseLayout()
        layoutPageSubViews()
        
    }
    
    func layoutPageSubViews() {
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
    }
    
    func initBaseLayout() {
        self.view.addSubview(backgroundImage)
        self.backgroundImage.addSubview(personMessageBtn)
        self.backgroundImage.addSubview(changeVersionBtn)
        self.backgroundImage.addSubview(settingBtn)
        self.backgroundImage.addSubview(updateVersionBtn)
        initNavigationBar("navgationbar_setting_icon_normal_iPhone", showLeft: true, showRight: false)
       
    }
    
    
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
            _personMessageBtn.setBackgroundImage(UIImage(named: "Setting_personMessage_btn_normal_iPhone"), forState: .Normal)
            _personMessageBtn.setBackgroundImage(UIImage(named: "Setting_personMessage_btn_selected_iPhone"), forState: .Selected)
            _personMessageBtn.addTarget(self, action: #selector(SettingViewController.personMessageBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _personMessageBtn
    }
    //个人信息
    func personMessageBtn(sender:AnyObject) {
        self.backgroundImage.addSubview(personMessageView)
        personMessageView.snp_makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp_top).offset(70/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(260/414*HEIGHT)
        }
        personMessageBtn.selected = true

    }
    
    var _changeVersionBtn:UIButton!
    var changeVersionBtn:UIButton {
        if _changeVersionBtn == nil {
            _changeVersionBtn = UIButton()
            _changeVersionBtn.setBackgroundImage(UIImage(named: "Setting_changeVersion_btn_normal_iPhone"), forState: .Normal)
            _changeVersionBtn.setBackgroundImage(UIImage(named: "Setting_changeVersion_btn_selected_iPhone"), forState: .Selected)
            _changeVersionBtn.addTarget(self, action: #selector(SettingViewController.changeVersionBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _changeVersionBtn
    }
    
    //切换版本
    func changeVersionBtn(sender:AnyObject) {
        
    }
    
    var _settingBtn:UIButton!
    var settingBtn:UIButton {
        if _settingBtn == nil {
            _settingBtn = UIButton()
            _settingBtn.setBackgroundImage(UIImage(named: "Setting_systemSetting_btn_normal_iPhone"), forState: .Normal)
            _settingBtn.setBackgroundImage(UIImage(named: "Setting_systemSetting_btn_selected_iPhone"), forState: .Selected)
            _settingBtn.addTarget(self, action: #selector(SettingViewController.settingBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _settingBtn
    }
    
    //系统设置
    func settingBtn(sender:AnyObject) {
        
    }
    
    var _updateVersionBtn:UIButton!
    var updateVersionBtn:UIButton {
        if _updateVersionBtn == nil {
            _updateVersionBtn = UIButton()
            _updateVersionBtn.setBackgroundImage(UIImage(named: "setting_update_btn_normal_iphone"), forState: .Normal)
            _updateVersionBtn.setBackgroundImage(UIImage(named: "Setting_update_btn_selected_iPhone"), forState: .Selected)
            _updateVersionBtn.addTarget(self, action: #selector(SettingViewController.updateVersionBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _updateVersionBtn
    }
    
    //版本更新
    func updateVersionBtn(sender:AnyObject) {
        
    }
    
    var _personMessageView:UIImageView!
    var personMessageView:UIImageView {
        if _personMessageView == nil {
            _personMessageView = UIImageView()
            _personMessageView.userInteractionEnabled = true
            _personMessageView.image = UIImage(named: "setting_infotext_icon_normal_iphone")
        }
        return _personMessageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

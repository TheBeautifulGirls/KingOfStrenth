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
    
    func layoutPageChangeVersionSubViews(){
        changeBgView.snp_makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp_top).offset(60/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(500/736*WIDTH)
            make.height.equalTo(300/414*HEIGHT)
        }
        mathBtn.snp_makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp_top).offset(65/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(200/736*WIDTH)
            make.width.equalTo(140/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        self.changeBgView.addSubview(physicsBtn)
        physicsBtn.snp_makeConstraints { (make) in
            make.top.equalTo(mathBtn.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(200/736*WIDTH)
            make.width.equalTo(140/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        self.changeBgView.addSubview(chemicalBtn)
        chemicalBtn.snp_makeConstraints { (make) in
            make.top.equalTo(physicsBtn.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(200/736*WIDTH)
            make.width.equalTo(140/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        self.changeBgView.addSubview(englishBtn)
        englishBtn.snp_makeConstraints { (make) in
            make.top.equalTo(chemicalBtn.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(200/736*WIDTH)
            make.width.equalTo(140/736*WIDTH)
            make.height.equalTo(40/414*HEIGHT)
        }
        
        self.changeBgView.addSubview(chineseBtn)
        chineseBtn.snp_makeConstraints { (make) in
            make.top.equalTo(englishBtn.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(200/736*WIDTH)
            make.width.equalTo(140/736*WIDTH)
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
        self.personMessageView.hidden = false
        self.changeBgView.hidden = true
        self.changeVersionBtn.selected = false
       
        personMessageView.snp_makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp_top).offset(80/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(260/414*HEIGHT)
        }
        personMessageBtn.selected = true
        self.personMessageView.addSubview(nickTxt)
        nickTxt.snp_makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp_top)
.offset(70/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(140/736*WIDTH)
            make.right.equalTo(backgroundImage.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        
        }
        
        self.personMessageView.addSubview(nameTxt)
        nameTxt.snp_makeConstraints { (make) in
            make.top.equalTo(nickTxt.snp_bottom)
                .offset(10/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(140/736*WIDTH)
            make.right.equalTo(backgroundImage.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
            
        }
        
        self.personMessageView.addSubview(birthdayBtn)
        birthdayBtn.snp_makeConstraints { (make) in
            make.top.equalTo(nameTxt.snp_bottom)
                .offset(10/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(135/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(manCheckBtn)
        manCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(140/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(manLabel)
        manLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(manCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(womanCheckBtn)
        womanCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(manLabel.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(womanLabel)
        womanLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(womanCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(sercetCheckBtn)
        sercetCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(womanLabel.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(sercetLabel)
        sercetLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(sercetCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(60/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(cityBtn)
        cityBtn.snp_makeConstraints { (make) in
            make.top.equalTo(manCheckBtn.snp_bottom).offset(14/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(135/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(schoolTxt)
        schoolTxt.snp_makeConstraints { (make) in
            make.top.equalTo(cityBtn.snp_bottom).offset(12/414*HEIGHT)
            make.left.equalTo(personMessageBtn.snp_right).offset(140/736*WIDTH)
            make.right.equalTo(backgroundImage.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(gradeLabel)
        gradeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(schoolTxt.snp_bottom).offset(6/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(280/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        self.personMessageView.addSubview(saveBtn)
        saveBtn.snp_makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(backgroundImage.snp_left).offset(360/736*WIDTH)
            make.width.equalTo(100/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
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
    
    var _changeBgView:UIImageView!
    var changeBgView:UIImageView {
        if _changeBgView == nil {
            _changeBgView = UIImageView()
            _changeBgView.userInteractionEnabled = true
            _changeBgView.backgroundColor = UIColor.clearColor()
        }
        return _changeBgView
    }
    
    //切换版本
    func changeVersionBtn(sender:AnyObject) {
        self.personMessageBtn.selected = false
        self.changeVersionBtn.selected = true
        self.personMessageView.hidden = true
        self.backgroundImage.addSubview(changeBgView)
        self.changeBgView.hidden = false
        self.changeBgView.addSubview(mathBtn)
        layoutPageChangeVersionSubViews()
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
    
    var _nickTxt:UITextField!
    var nickTxt:UITextField {
        if _nickTxt == nil {
           _nickTxt = InputBoxView(showLeftView: false, showLeftBank: true)
        }
        return _nickTxt
    }
    
    var _nameTxt:UITextField!
    var nameTxt:UITextField {
        if _nameTxt == nil {
            _nameTxt = InputBoxView(showLeftView: false, showLeftBank: true)
        }
        return _nameTxt
    }
    
    var _birthdayBtn:UIButton!
    var birthdayBtn:UIButton {
        if _birthdayBtn == nil {
            _birthdayBtn = UIButton()
            _birthdayBtn.setTitle("点击选择", forState: .Normal)
            _birthdayBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
            _birthdayBtn.setTitleColor(UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1), forState: .Normal)
        }
        return _birthdayBtn
    }
    
    var _manCheckBtn:UIButton!
    var manCheckBtn:UIButton {
        if _manCheckBtn == nil {
            _manCheckBtn = UIButton()
            _manCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _manCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _manCheckBtn.addTarget(self, action: #selector(SettingViewController.manCheckBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _manCheckBtn
    }
    
    func manCheckBtn(sender:AnyObject) {
        
    }
    
    var _manLabel:UILabel!
    var manLabel:UILabel {
        if _manLabel == nil {
            _manLabel = UILabel()
            _manLabel.text = "男"
            _manLabel.textColor = UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
            _manLabel.font = UIFont.boldSystemFontOfSize(15)
        }
        return _manLabel
    }
    
    var _womanCheckBtn:UIButton!
    var womanCheckBtn:UIButton {
        if _womanCheckBtn == nil {
            _womanCheckBtn = UIButton()
            _womanCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _womanCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _womanCheckBtn.addTarget(self, action: #selector(SettingViewController.womanCheckBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _womanCheckBtn
    }
    
    func womanCheckBtn(sender:AnyObject) {
        
    }
    
    var _womanLabel:UILabel!
    var womanLabel:UILabel {
        if _womanLabel == nil {
            _womanLabel = UILabel()
            _womanLabel.text = "女"
            _womanLabel.textColor = UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
            _womanLabel.font = UIFont.boldSystemFontOfSize(15)
        }
        return _womanLabel
    }
    
    var _sercetCheckBtn:UIButton!
    var sercetCheckBtn:UIButton {
        if _sercetCheckBtn == nil {
            _sercetCheckBtn = UIButton()
            _sercetCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _sercetCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _sercetCheckBtn.addTarget(self, action: #selector(SettingViewController.sercetCheckBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _sercetCheckBtn
    }
    
    func sercetCheckBtn(sender:AnyObject) {
        
    }
    
    var _sercetLabel:UILabel!
    var sercetLabel:UILabel {
        if _sercetLabel == nil {
            _sercetLabel = UILabel()
            _sercetLabel.text = "保密"
            _sercetLabel.textColor = UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
            _sercetLabel.font = UIFont.boldSystemFontOfSize(15)
        }
        return _sercetLabel
    }
    
    var _cityBtn:UIButton!
    var cityBtn:UIButton {
        if _cityBtn == nil {
            _cityBtn = UIButton()
            _cityBtn.setTitle("点击选择", forState: .Normal)
            _cityBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
            _cityBtn.setTitleColor(UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1), forState: .Normal)
        }
        return _cityBtn
    }

    var _schoolTxt:UITextField!
    var schoolTxt:UITextField {
        if _schoolTxt == nil {
            _schoolTxt = InputBoxView(showLeftView: false, showLeftBank: true)
        }
        return _schoolTxt
    }
    
    var _gradeLabel:UILabel!
    var gradeLabel:UILabel {
        if _gradeLabel == nil {
            _gradeLabel = UILabel()
            _gradeLabel.text = "初中"
            _gradeLabel.font = UIFont.systemFontOfSize(15)
            _gradeLabel.textColor = UIColor.init(red: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
        }
        return _gradeLabel
    }
    
    var _saveBtn:UIButton!
    var saveBtn:UIButton {
        if _saveBtn == nil {
            _saveBtn = UIButton()
            _saveBtn.setBackgroundImage(UIImage(named: "Setting_save_btn_normal_iPhone"), forState: .Normal)
            _saveBtn.setBackgroundImage(UIImage(named: "Setting_save_btn_selected_iPhone"), forState:.Highlighted)
            _saveBtn.addTarget(self, action: #selector(SettingViewController.saveBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _saveBtn
    }
    
    func saveBtn(sender:AnyObject) {
        
    }
    
    var _mathBtn:UIButton!
    var mathBtn:UIButton {
        if _mathBtn == nil {
            _mathBtn = UIButton()
            _mathBtn.setBackgroundImage(UIImage(named: "Common_Math_btn_normal_iPhone"), forState: .Normal)
            _mathBtn.setBackgroundImage(UIImage(named: "Common_Math_btn_selected_iPhone"), forState: .Selected)
            _mathBtn.addTarget(self, action: #selector(SettingViewController.mathBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _mathBtn
    }
    
    func mathBtn(sender:AnyObject) {
        
    }
    
    var _physicsBtn:UIButton!
    var physicsBtn:UIButton {
        if _physicsBtn == nil {
            _physicsBtn = UIButton()
            _physicsBtn.setBackgroundImage(UIImage(named: "Common_Physics_btn_normal_iPhone"), forState: .Normal)
            _physicsBtn.setBackgroundImage(UIImage(named: "Common_Physics_btn_selected_iPhone"), forState: .Selected)
            _physicsBtn.addTarget(self, action: #selector(SettingViewController.physicsBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _physicsBtn
    }
    
    func physicsBtn(sender:AnyObject) {
        
    }
    
    var _chemicalBtn:UIButton!
    var chemicalBtn:UIButton {
        if _chemicalBtn == nil {
            _chemicalBtn = UIButton()
            _chemicalBtn.setBackgroundImage(UIImage(named: "Common_Chemical_btn_normal_iPhone"), forState: .Normal)
            _chemicalBtn.setBackgroundImage(UIImage(named: "Common_Chemical_btn_selected_iPhone"), forState: .Selected)
            _chemicalBtn.addTarget(self, action: #selector(SettingViewController.chemicalBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _chemicalBtn
    }
    
    func chemicalBtn(sender:AnyObject) {
        
    }
    
    var _englishBtn:UIButton!
    var englishBtn:UIButton {
        if _englishBtn == nil {
            _englishBtn = UIButton()
            _englishBtn.setBackgroundImage(UIImage(named: "Common_English_btn_normal_iPhone"), forState: .Normal)
            _englishBtn.setBackgroundImage(UIImage(named: "Common_English_btn_selected_iPhone"), forState: .Selected)
            _englishBtn.addTarget(self, action: #selector(SettingViewController.englishBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _englishBtn
    }
    
    func englishBtn(sender:AnyObject) {
        
    }
    
    var _chineseBtn:UIButton!
    var chineseBtn:UIButton {
        if _chineseBtn == nil {
            _chineseBtn = UIButton()
            _chineseBtn.setBackgroundImage(UIImage(named: "Common_Chinese_btn_normal_iPhone"), forState: .Normal)
            _chineseBtn.setBackgroundImage(UIImage(named: "Common_Chinese_btn_selected_iPhone"), forState: .Selected)
            _chineseBtn.addTarget(self, action: #selector(SettingViewController.chineseBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _chineseBtn
    }
    
    func chineseBtn(sender:AnyObject) {
        
    }
    
//    var _cancelAccountBtn:UIButton!
//    var cancelAccountBtn:UIButton {
//        if _cancelAccountBtn == nil {
//            _cancelAccountBtn = UIButton()
//            _cancelAccountBtn.setBackgroundImage(UIImage(named:"" ), forState: .Normal)
//            _cancelAccountBtn.setBackgroundImage(, forState: <#T##UIControlState#>)
//        }
//        return _cancelAccountBtn
//    }

    
}

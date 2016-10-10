//
//  PersonalInformationController.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class PersonalInformationController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        
        initBaseLayout()
        layoutPageSubViews()
    }
    
    //MARK: - private method
    func initBaseLayout(){
        self.view.addSubview(personMessageView)
        personMessageView.addSubview(nickTxt)
        personMessageView.addSubview(nameTxt)
        personMessageView.addSubview(birthdayBtn)
        personMessageView.addSubview(manCheckBtn)
        personMessageView.addSubview(manLabel)
        personMessageView.addSubview(womanCheckBtn)
        personMessageView.addSubview(womanLabel)
        personMessageView.addSubview(sercetCheckBtn)
        personMessageView.addSubview(sercetLabel)
        personMessageView.addSubview(cityBtn)
        personMessageView.addSubview(schoolTxt)
        personMessageView.addSubview(gradeLabel)
        personMessageView.addSubview(saveBtn)
        
    }
    
    func layoutPageSubViews(){
        personMessageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top).offset(15/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(40/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(260/414*HEIGHT)
        }
        
        nickTxt.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top)
                .offset(7.5/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.right.equalTo(self.view.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
            
        }
        
        nameTxt.snp_makeConstraints { (make) in
            make.top.equalTo(nickTxt.snp_bottom)
                .offset(10/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.right.equalTo(self.view.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
            
        }
        
        birthdayBtn.snp_makeConstraints { (make) in
            make.top.equalTo(nameTxt.snp_bottom)
                .offset(10/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(135/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        manCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        manLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(manCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        womanCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(manLabel.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        womanLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(womanCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        sercetCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(womanLabel.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        sercetLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(sercetCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(60/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        cityBtn.snp_makeConstraints { (make) in
            make.top.equalTo(manCheckBtn.snp_bottom).offset(14/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(135/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        schoolTxt.snp_makeConstraints { (make) in
            make.top.equalTo(cityBtn.snp_bottom).offset(12/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.right.equalTo(self.view.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        gradeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(schoolTxt.snp_bottom).offset(6/414*HEIGHT)
            //make.left.equalTo(self.view.snp_left).offset(280/736*WIDTH)
            make.left.equalTo(schoolTxt)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        saveBtn.snp_makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(gradeLabel.snp_right).offset(45/736*WIDTH)
            make.width.equalTo(100/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }

  
    }
    
    //MARK: - setting and getting
    var _personMessageView:UIImageView!
    var personMessageView:UIImageView {
        if _personMessageView == nil {
            _personMessageView = UIImageView()
            _personMessageView.userInteractionEnabled = true
            _personMessageView.image = UIImage(named: "setting_infotext_icon_normal_iphone")
        }
        return _personMessageView
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
            _birthdayBtn.addTarget(self, action: #selector(PersonalInformationController.selectBirthdayDate(_:)), forControlEvents: .TouchUpInside)
        }
        return _birthdayBtn
    }
    
    var _manCheckBtn:UIButton!
    var manCheckBtn:UIButton {
        if _manCheckBtn == nil {
            _manCheckBtn = UIButton()
            _manCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _manCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _manCheckBtn.addTarget(self, action: #selector(PersonalInformationController.manCheckBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _manCheckBtn
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
            _womanCheckBtn.addTarget(self, action: #selector(PersonalInformationController.womanCheckBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _womanCheckBtn
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
            _sercetCheckBtn.addTarget(self, action: #selector(PersonalInformationController.sercetCheckBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _sercetCheckBtn
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
            _saveBtn.addTarget(self, action: #selector(PersonalInformationController.saveBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _saveBtn
    }
    

    
    //MARK: - event response
    func saveBtn(sender:AnyObject) {
        
    }
    
    func sercetCheckBtn(sender:AnyObject) {
        
    }
    
    func womanCheckBtn(sender:AnyObject) {
        
    }
    
    func manCheckBtn(sender:AnyObject) {
        
    }
    
    func selectBirthdayDate(sender:UIButton){
        
    }
    


}

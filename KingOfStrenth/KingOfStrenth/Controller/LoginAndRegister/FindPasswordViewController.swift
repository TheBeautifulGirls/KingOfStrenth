//
//  FindPasswordViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/22.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SnapKit

class FindPasswordViewController: BaseViewController {
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar("", showLeft: true, showRight: false)
        self.view.backgroundColor = UIColor(red: 251 / 255, green: 231 / 255, blue: 185 / 255, alpha: 1)
        
        initBaseLayout()
        layoutPageSubViews()

    }
    //MARK: - prinvate methods
    func initBaseLayout(){
       self.view.addSubview(titleImageView)
        self.view.addSubview(phoneNumber)
        self.view.addSubview(codeNumber)
        self.view.addSubview(getCodeNumberBtn)
        self.view.addSubview(passwordNumber)
        self.view.addSubview(confirmPassword)
        self.view.addSubview(resetPassword)
    }
    
    func layoutPageSubViews(){
        titleImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(50)
            make.width.equalTo(314 / 2)
            make.height.equalTo(81 / 2)
        }
        
        phoneNumber.snp_makeConstraints { (make) in
            make.top.equalTo(titleImageView.snp_bottom).offset(10)
            make.centerX.equalTo(titleImageView)
            make.width.equalTo((247 / 568) * self.view.frame.size.width)
            make.height.equalTo(27)
        }
        
        codeNumber.snp_makeConstraints { (make) in
            make.left.equalTo(phoneNumber)
            make.top.equalTo(phoneNumber.snp_bottom).offset(10)
            make.width.equalTo((167 / 568) * self.view.frame.size.width)
            make.height.equalTo(27)
        }
        
        getCodeNumberBtn.snp_makeConstraints { (make) in
            make.left.equalTo(codeNumber.snp_right).offset(3)
            make.top.equalTo(phoneNumber.snp_bottom).offset(10)
            make.width.equalTo((77 / 568) * self.view.frame.size.width)
            make.height.equalTo(25)

        }
        
        passwordNumber.snp_makeConstraints { (make) in
            make.centerX.equalTo(phoneNumber)
            make.top.equalTo(codeNumber.snp_bottom).offset(10)
            make.width.equalTo((247 / 568) * self.view.frame.size.width)
            make.height.equalTo(27)
        }
        
        confirmPassword.snp_makeConstraints { (make) in
            make.centerX.equalTo(phoneNumber)
            make.top.equalTo(passwordNumber.snp_bottom).offset(10)
            make.width.equalTo((247 / 568) * self.view.frame.size.width)
            make.height.equalTo(27)
        }
        
        resetPassword.snp_makeConstraints { (make) in
            make.centerX.equalTo(confirmPassword)
            make.top.equalTo(confirmPassword.snp_bottom).offset(8)
            make.width.equalTo((100 / 568) * self.view.frame.size.width)
            make.height.equalTo(31)
        }
    }
    
    //MARK: - getting and setting
    var _titleImageView:UIImageView!
    var titleImageView:UIImageView{
        if _titleImageView == nil{
           _titleImageView = UIImageView()
            _titleImageView.backgroundColor = UIColor.clearColor()
            _titleImageView.image = UIImage(named: "loginandregister_findpassword_title_iphone")
           
        }
        return _titleImageView
    }
    
    var _phoneNumber:InputBoxView!
    var phoneNumber:InputBoxView{
        if _phoneNumber == nil{
            _phoneNumber = InputBoxView(showLeftView: true, showLeftBank: false)
            _phoneNumber.leftImageView.image = UIImage(named: "loginandregister_phonenum_icon_iphone")
            _phoneNumber.placeholder = "手机号"
            _phoneNumber.font = UIFont.systemFontOfSize(12)
            
        }
        return _phoneNumber
    }
    
    var _codeNumber:InputBoxView!
    var codeNumber:InputBoxView{
        if _codeNumber == nil{
            _codeNumber = InputBoxView(showLeftView: true, showLeftBank: false)
            _codeNumber.leftImageView.image = UIImage(named: "loginandregister_code_icon_iphone")
            _codeNumber.placeholder = "验证码"
            _codeNumber.font = UIFont.systemFontOfSize(12)
            
        }
        return _codeNumber
    }
    
    var _getCodeNumberBtn:UIButton!
    var getCodeNumberBtn:UIButton{
        if _getCodeNumberBtn == nil{
            _getCodeNumberBtn = UIButton()
            _getCodeNumberBtn.titleLabel?.font = UIFont.systemFontOfSize(12)
            _getCodeNumberBtn.setBackgroundImage(UIImage(named: "loginandregister_getcode_btn_normal_iphone"), forState: UIControlState.Normal)
            _getCodeNumberBtn.setBackgroundImage(UIImage(named: "loginandregister_getcode_btn_highlight_iphone"), forState: .Highlighted)
             _getCodeNumberBtn.setBackgroundImage(UIImage(named: "loginandregister_getcode_btn_highlight_iphone"), forState: .Selected)
            _getCodeNumberBtn.addTarget(self, action: #selector(FindPasswordViewController.getCodeNumber(_:)), forControlEvents: .TouchUpInside)
        }
        return _getCodeNumberBtn
    }
    
    var _passwordNumber:InputBoxView!
    var passwordNumber:InputBoxView{
        if _passwordNumber == nil{
            _passwordNumber = InputBoxView(showLeftView: true, showLeftBank: false)
            _passwordNumber.leftImageView.image = UIImage(named: "loginandregister_password_icon_iphone")
            _passwordNumber.placeholder = "密码"
            _passwordNumber.font = UIFont.systemFontOfSize(12)
            
        }
        return _passwordNumber
    }
    
    var _confirmPassword:InputBoxView!
    var confirmPassword:InputBoxView{
        if _confirmPassword == nil{
            _confirmPassword = InputBoxView(showLeftView: true, showLeftBank: false)
            _confirmPassword.leftImageView.image = UIImage(named: "loginandregister_password_icon_iphone")
            _confirmPassword.placeholder = "确认密码"
            _confirmPassword.secureTextEntry = true
            _confirmPassword.font = UIFont.systemFontOfSize(12)
        }
        return _confirmPassword
    }
    
    var _resetPassword:UIButton!
    var resetPassword:UIButton{
        if _resetPassword == nil{
            _resetPassword = UIButton()
            _resetPassword.setBackgroundImage(UIImage(named: "loginandregister_resetpassword_btn_normal_iphone"), forState: .Normal)
            _resetPassword.addTarget(self, action: #selector(FindPasswordViewController.resetPassword(_:)), forControlEvents: .TouchUpInside)
        }
        return _resetPassword
    }

    
    //MARK: - event response
    func getCodeNumber(btn:UIButton){
        print("获取验证码")
        if phoneNumber.text == "" {
            YAlertViewController.showAlertController(self, title: "提示", message: "手机号不能为空")
            return
        } else if phoneNumber.text!.isMobileNumber() == false  {
            YAlertViewController.showAlertController(self, title: "提示", message: "手机号由11位数字组成")
            return
        }
        
        
    }
    
    func resetPassword(btn:UIButton){
        //判定各种情况
        if phoneNumber.text == "" {
            YAlertViewController.showAlertController(self, title: "提示", message: "手机号不能为空")
            return
        } else {
            if phoneNumber.text!.isMobileNumber() == false {
                YAlertViewController.showAlertController(self, title: "提示", message: "手机号错误")
                return
            }
        }
        
        if passwordNumber.text == "" {
            YAlertViewController.showAlertController(self, title: "提示", message: "密码不能为空")
            return
        } else {
            if passwordNumber.text?.characters.count < 6 || passwordNumber.text?.characters.count > 20 {
                YAlertViewController.showAlertController(self, title: "提示", message: "密码由6-20位字母，数字，下滑线组成")
                return
                
            } else {
                if passwordNumber.text!.isHeaderUnderlineNumChar() == false {
                    YAlertViewController.showAlertController(self, title: "提示", message: "密码由6-20位字母，数字，下滑线组成")
                    return
                }
            }
        }
        if codeNumber.text == "" {
            YAlertViewController.showAlertController(self, title: "验证码不能为空", message: "")
            return
        }
        
    }
    

}
//
//  RegisterViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/21.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        layoutPageSubViews()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
        
        // 添加通知中心监听，当键盘出现或消失时
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    deinit {
        // 删除通知中心监听
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - event response
    func selectPhase(sender: UIButton) {
        if sender.tag == 1 {
            sender.setImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Normal)
            let button = self.view.viewWithTag(2) as! UIButton
            button.setImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
        } else {
            sender.setImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Normal)
            let button = self.view.viewWithTag(1) as! UIButton
            button.setImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
        }
    }
    
    // MARK: - private method
    func initBaseLayout() {
        self.view.backgroundColor = UIColor(hexString: "#FBE8B6")
        initNavigationBar("navgationbar_register_btn_normal_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(bgView)
        bgView.addSubview(phaseLabel)
        bgView.addSubview(phoneLabel)
        bgView.addSubview(securityCodeLabel)
        bgView.addSubview(userNameLabel)
        bgView.addSubview(passwordLabel)
        bgView.addSubview(confirmPasswordLabel)
        bgView.addSubview(JuniorCheckButton)
        bgView.addSubview(JuniorCheckLabel)
        bgView.addSubview(HighCheckButton)
        bgView.addSubview(HighCheckLabel)
        bgView.addSubview(phoneTextField)
        bgView.addSubview(getCodeButton)
        bgView.addSubview(securityCodeTextField)
        bgView.addSubview(userNameTextField)
        bgView.addSubview(passwordTextField)
        bgView.addSubview(confirmPasswordTextField)
        bgView.addSubview(agreementButton)
        bgView.addSubview(agreementLabel)
        bgView.addSubview(agreementLinkBtn)
        bgView.addSubview(registerButton)
    }
    func layoutPageSubViews() {
        bgView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
            make.width.equalTo(SCREEN_WIDTH - 20)
        }
        phaseLabel.snp_makeConstraints { (make) in
            make.top.equalTo(bgView.snp_top).offset(5)
            make.right.equalTo(self.view).offset(-450)
            make.height.equalTo(27)
        }
        phoneLabel.snp_makeConstraints { (make) in
            make.top.equalTo(phaseLabel.snp_bottom).offset(10)
            make.right.equalTo(self.view).offset(-450)
            make.height.equalTo(27)
        }
        securityCodeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(phoneLabel.snp_bottom).offset(15)
            make.right.equalTo(self.view).offset(-450)
            make.height.equalTo(27)
        }
        userNameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(securityCodeLabel.snp_bottom).offset(15)
            make.right.equalTo(self.view).offset(-450)
            make.height.equalTo(27)
        }
        passwordLabel.snp_makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp_bottom).offset(15)
            make.right.equalTo(self.view).offset(-450)
            make.height.equalTo(27)
        }
        confirmPasswordLabel.snp_makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp_bottom).offset(15)
            make.right.equalTo(self.view).offset(-450)
            make.height.equalTo(27)
        }
        JuniorCheckButton.snp_makeConstraints { (make) in
            make.left.equalTo(phaseLabel.snp_right).offset(15)
            make.top.equalTo(bgView).offset(8)
            make.width.equalTo(22)
            make.height.equalTo(22)
        }
        JuniorCheckLabel.snp_makeConstraints { (make) in
            make.top.equalTo(bgView).offset(8)
            make.left.equalTo(JuniorCheckButton.snp_right).offset(3)
            make.height.equalTo(20)
        }
        HighCheckButton.snp_makeConstraints { (make) in
            make.left.equalTo(JuniorCheckLabel.snp_right).offset(25)
            make.top.equalTo(bgView).offset(8)
            make.width.equalTo(22)
            make.height.equalTo(22)
        }
        HighCheckLabel.snp_makeConstraints { (make) in
            make.top.equalTo(bgView).offset(8)
            make.left.equalTo(HighCheckButton.snp_right).offset(3)
            make.height.equalTo(20)
        }
        phoneTextField.snp_makeConstraints { (make) in
            make.top.equalTo(phaseLabel.snp_bottom).offset(10)
            make.left.equalTo(phoneLabel.snp_right).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(31)
        }
        getCodeButton.snp_makeConstraints { (make) in
            make.top.equalTo(phaseLabel.snp_bottom).offset(10)
            make.left.equalTo(phoneTextField.snp_right).offset(10)
            make.width.equalTo(110)
            make.height.equalTo(31)
            
        }
        securityCodeTextField.snp_makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp_bottom).offset(10)
            make.left.equalTo(securityCodeLabel.snp_right).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(31)
        }
        userNameTextField.snp_makeConstraints { (make) in
            make.top.equalTo(securityCodeTextField.snp_bottom).offset(10)
            make.left.equalTo(userNameLabel.snp_right).offset(15)
            make.width.equalTo(355)
            make.height.equalTo(31)
        }
        passwordTextField.snp_makeConstraints { (make) in
            make.top.equalTo(userNameTextField.snp_bottom).offset(10)
            make.left.equalTo(passwordLabel.snp_right).offset(15)
            make.width.equalTo(355)
            make.height.equalTo(31)
        }
        confirmPasswordTextField.snp_makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp_bottom).offset(10)
            make.left.equalTo(confirmPasswordLabel.snp_right).offset(15)
            make.width.equalTo(355)
            make.height.equalTo(31)
        }
        agreementButton.snp_makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp_bottom).offset(5)
            make.left.equalTo(confirmPasswordLabel.snp_right).offset(15)
            make.width.equalTo(22)
            make.height.equalTo(22)
        }
        agreementLabel.snp_makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp_bottom).offset(5)
            make.left.equalTo(agreementButton.snp_right).offset(5)
            make.height.equalTo(25)
        }
        agreementLinkBtn.snp_makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp_bottom).offset(5)
            make.left.equalTo(agreementLabel.snp_right).offset(5)
            make.height.equalTo(25)
        }
        registerButton.snp_makeConstraints { (make) in
            make.top.equalTo(agreementLinkBtn.snp_bottom).offset(5)
            make.centerX.equalTo(bgView)
            make.height.equalTo(30)
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        // 获取键盘frame
        let keyBoardFrame = notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue()
        let height = keyBoardFrame?.origin.y
        // 计算控制器的view需要移动的距离
        let textField_maxY = 260
        // 键盘距离输入框的间距
        let transformY = height! - CGFloat(textField_maxY)
        // 当键盘会挡到输入框就开始移动
        if transformY < 0 {
            var frame = self.view.frame
            frame.origin.y = transformY
            self.view.frame = frame
        }
        
    }
    func keyboardWillHide(notification: NSNotification) {
        var frame = self.view.frame
        frame.origin.y = 0
        self.view.frame = frame
    }
    
    //MARK: --setter and getter
    var _bgView: UIScrollView!
    var bgView: UIScrollView {
        if _bgView == nil {
            _bgView = UIScrollView()
            _bgView.scrollEnabled = true
            _bgView.alwaysBounceVertical = true
            _bgView.showsVerticalScrollIndicator = false
            _bgView.contentSize = CGSizeMake(self.view.bounds.size.width-20, 320)
            _bgView.backgroundColor = UIColor.clearColor()
        }
        return _bgView
    }
    var _phaseLabel: UILabel!
    var phaseLabel: UILabel {
        if _phaseLabel == nil {
            _phaseLabel = UILabel()
            _phaseLabel.textAlignment = .Right
            _phaseLabel.font = UIFont.systemFontOfSize(18)
            _phaseLabel.text = "学段:"
            _phaseLabel.textColor = UIColor(hexString: "#8E2729")
        }
        return _phaseLabel
    }
    var _phoneLabel: UILabel!
    var phoneLabel: UILabel {
        if _phoneLabel == nil {
            _phoneLabel = UILabel()
            _phoneLabel.textAlignment = .Right
            _phoneLabel.font = UIFont.systemFontOfSize(18)
            _phoneLabel.text = "手机号:"
            _phoneLabel.textColor = UIColor(hexString: "#8E2729")
        }
        return _phoneLabel
    }
    var _securityCodeLabel: UILabel!
    var securityCodeLabel: UILabel {
        if _securityCodeLabel == nil {
            _securityCodeLabel = UILabel()
            _securityCodeLabel.textAlignment = .Right
            _securityCodeLabel.font = UIFont.systemFontOfSize(18)
            _securityCodeLabel.text = "验证码:"
            _securityCodeLabel.textColor = UIColor(hexString: "#8E2729")
        }
        return _securityCodeLabel
    }
    var _userNameLabel: UILabel!
    var userNameLabel: UILabel {
        if _userNameLabel == nil {
            _userNameLabel = UILabel()
            _userNameLabel.textAlignment = .Right
            _userNameLabel.font = UIFont.systemFontOfSize(18)
            _userNameLabel.text = "用户名:"
            _userNameLabel.textColor = UIColor(hexString: "#8E2729")
        }
        return _userNameLabel
    }
    var _passwordLabel: UILabel!
    var passwordLabel: UILabel {
        if _passwordLabel == nil {
            _passwordLabel = UILabel()
            _passwordLabel.textAlignment = .Right
            _passwordLabel.font = UIFont.systemFontOfSize(18)
            _passwordLabel.text = "密码:"
            _passwordLabel.textColor = UIColor(hexString: "#8E2729")
        }
        return _passwordLabel
    }
    var _confirmPasswordLabel: UILabel!
    var confirmPasswordLabel: UILabel {
        if _confirmPasswordLabel == nil {
            _confirmPasswordLabel = UILabel()
            _confirmPasswordLabel.textAlignment = .Right
            _confirmPasswordLabel.font = UIFont.systemFontOfSize(18)
            _confirmPasswordLabel.text = "确认密码:"
            _confirmPasswordLabel.textColor = UIColor(hexString: "#8E2729")
        }
        return _confirmPasswordLabel
    }
    var _JuniorCheckButton: UIButton!
    var JuniorCheckButton: UIButton {
        if _JuniorCheckButton == nil {
            _JuniorCheckButton = UIButton(type: .Custom)
            _JuniorCheckButton.tag = 1
            _JuniorCheckButton.setImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _JuniorCheckButton.setImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _JuniorCheckButton.addTarget(self, action: #selector(RegisterViewController.selectPhase(_:)), forControlEvents: .TouchUpInside)
        }
        return _JuniorCheckButton
    }
    var _HighCheckButton: UIButton!
    var HighCheckButton: UIButton {
        if _HighCheckButton == nil {
            _HighCheckButton = UIButton()
            _HighCheckButton.tag = 2
            _HighCheckButton.setImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _HighCheckButton.setImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _HighCheckButton.addTarget(self, action: #selector(RegisterViewController.selectPhase(_:)), forControlEvents: .TouchUpInside)
        }
        return _HighCheckButton
    }
    var _JuniorCheckLabel: UILabel!
    var JuniorCheckLabel: UILabel {
        if _JuniorCheckLabel == nil {
            _JuniorCheckLabel = UILabel()
            _JuniorCheckLabel.text = "初中"
            _JuniorCheckLabel.textColor = UIColor.blackColor()
        }
        return _JuniorCheckLabel
    }
    var _HighCheckLabel: UILabel!
    var HighCheckLabel: UILabel {
        if _HighCheckLabel == nil {
            _HighCheckLabel = UILabel()
            _HighCheckLabel.text = "高中"
            _HighCheckLabel.textColor = UIColor.blackColor()
        }
        return _HighCheckLabel
    }
    var _phoneTextField: InputBoxView!
    var phoneTextField: InputBoxView {
        if _phoneTextField == nil {
            _phoneTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _phoneTextField.placeholder = "请输入您的手机号"
        }
        return _phoneTextField
    }
    var _getCodeButton: UIButton!
    var getCodeButton: UIButton {
        if _getCodeButton == nil {
            _getCodeButton = UIButton(type: .Custom)
            _getCodeButton.setImage(UIImage(named: "loginandregister_getcode_btn_normal_iphone"), forState: .Normal)
            _getCodeButton.setImage(UIImage(named: "loginandregister_getcode_btn_selected_iphone"), forState: .Selected)
        }
        return _getCodeButton
    }
    var _securityCodeTextField: InputBoxView!
    var securityCodeTextField: InputBoxView {
        if _securityCodeTextField == nil {
            _securityCodeTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _securityCodeTextField.placeholder = "请输入您的验证码"
        }
        return _securityCodeTextField
    }
    var _userNameTextField: InputBoxView!
    var userNameTextField: InputBoxView {
        if _userNameTextField == nil {
            _userNameTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _userNameTextField.placeholder = "用户名由4~20位数字、英文字母、下划线组成"
        }
        return _userNameTextField
    }
    var _passwordTextField: InputBoxView!
    var passwordTextField: InputBoxView {
        if _passwordTextField == nil {
            _passwordTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _passwordTextField.placeholder = "密码（允许字母、数字、下划线，6~20位）"
        }
        return _passwordTextField
    }
    var _confirmPasswordTextField: InputBoxView!
    var confirmPasswordTextField: InputBoxView {
        if _confirmPasswordTextField == nil {
            _confirmPasswordTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _confirmPasswordTextField.placeholder = "请确认密码"
        }
        return _confirmPasswordTextField
    }
    var _intensityView: UIView!
    var intensityView: UIView {
        if _intensityView == nil {
            _intensityView = UIView()
            _intensityView.backgroundColor = UIColor.clearColor()
        }
        return _intensityView
    }
    var _agreementButton: UIButton!
    var agreementButton: UIButton {
        if _agreementButton == nil {
            _agreementButton = UIButton(type: .Custom)
            _agreementButton.setImage(UIImage(named: "loginandregister_checkbox_icon_normal_iphone"), forState: .Normal)
            _agreementButton.setImage(UIImage(named: "loginandregister_checkbox_icon_selected_iphone"), forState: .Selected)
        }
        return _agreementButton
    }
    var _agreementLabel: UILabel!
    var agreementLabel: UILabel {
        if _agreementLabel == nil {
            _agreementLabel = UILabel()
            _agreementLabel.text = "我已阅读并同意"
            _agreementLabel.textColor = UIColor.blackColor()
        }
        return _agreementLabel
    }
    var _agreementLinkBtn: UIButton!
    var agreementLinkBtn: UIButton {
        if _agreementLinkBtn == nil {
            _agreementLinkBtn = UIButton(type: .Custom)
            let attrs = [
                NSFontAttributeName : UIFont.systemFontOfSize(17.0),
                NSForegroundColorAttributeName : UIColor(red: 142/255.0, green: 39/255.0, blue: 41/255.0, alpha: 1),
                NSUnderlineStyleAttributeName : 1]
            let attributedString = NSMutableAttributedString(string:"")
            let buttonTitleStr = NSMutableAttributedString(string:"提分王用户服务协议", attributes:attrs)
            attributedString.appendAttributedString(buttonTitleStr)
            _agreementLinkBtn.setAttributedTitle(attributedString, forState: .Normal)
        }
        return _agreementLinkBtn
    }
    var _registButton: UIButton!
    var registerButton: UIButton {
        if _registButton == nil {
            _registButton = UIButton(type: .Custom)
            _registButton.setImage(UIImage(named: "loginandregister_account_btn_normal_iphone"), forState: .Normal)
            _registButton.setImage(UIImage(named: "loginandregister_account_btn_selected_iphone"), forState: .Selected)
        }
        return _registButton
    }
    
}


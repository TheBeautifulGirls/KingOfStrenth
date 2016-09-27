//
//  LoginViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/20.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//


import UIKit
import SnapKit

class LoginViewController: BaseViewController {

    var loginHelper: LoginViewControllerHelper?
    // 是否记住密码
    var isRemember: Bool = false
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        layoutPageSubViews()
        initHelper()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
    func rememberPasswordAction(sender: UIButton) {
        print("555")
        
        if !sender.selected {
            isRemember = true
            sender.selected = true
            sender.setBackgroundImage(UIImage(named: "loginandregister_checkbox_icon_selected_iphone"), forState: .Selected)
        } else {
            isRemember = false
            sender.selected = false
            sender.setBackgroundImage(UIImage(named: "loginandregister_checkbox_icon_normal_iphone"), forState: .Normal)
            if INFO.userName() == "" || INFO.password() == "" {
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.removeObjectForKey("This is userInfo")
                userDefaults.synchronize()
            }
        }
    }
    
    func forgetPasswordAction(sender: UIButton) {
        
        let findVC = FindPasswordViewController()
        self.navigationController?.pushViewController(findVC, animated: false)
    }
    
    func loginAction(sender: UIButton) {
        print("登录")
        
        if accountTextField.text == "" {
            YAlertViewController.showAlertController(self, title: "提示", message: "用户名不能为空")
            return
        }
        
        if passwordTextField.text == "" {
            YAlertViewController.showAlertController(self, title: "提示", message: "密码不能为空")
            return
        }
        
        if isRemember {
            let userInfo = NSMutableDictionary()
            userInfo["userName"] = accountTextField.text
            userInfo["password"] = passwordTextField.text
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setValue(userInfo, forKey: "This is userInfo")
            userDefaults.synchronize()
        }
        
        let model = LoginModel()
        if accountTextField.text != "" {
            model.userName = accountTextField.text
        }
        
        if passwordTextField.text != "" {
            model.password = passwordTextField.text
        }
        loginHelper?.loginRequest = model
        loginHelper?.loginManager?.showHUD()
        loginHelper?.loginManager?.loadData()
    }
    
    func registerAction(sender: UIButton) {
        print("注册")
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - private method
    func initBaseLayout() {
        
        self.view.userInteractionEnabled = true
        self.view.addSubview(backImageView)
        self.backImageView.addSubview(titleImageView)
        self.backImageView.addSubview(loginView)
        self.loginView.addSubview(accountLabel)
        self.loginView.addSubview(accountTextField)
        self.loginView.addSubview(passwordLabel)
        self.loginView.addSubview(passwordTextField)
        self.loginView.addSubview(rememberBtn)
        self.loginView.addSubview(rememberLabel)
        self.loginView.addSubview(forgetButton)
        self.loginView.addSubview(btnBackView)
        self.btnBackView.addSubview(loginBtn)
        self.btnBackView.addSubview(registerBtn)
    }
    
    func layoutPageSubViews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        titleImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            if isiPhone5s {
                make.top.equalTo(backImageView.snp_top).offset(30)
            } else {
                make.top.equalTo(backImageView.snp_top).offset(40)
            }
            make.width.equalTo(253)
            make.height.equalTo(34.5)
        }
        loginView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            if isiPhone5s {
                make.width.equalTo(280)
                make.height.equalTo(215)
                make.top.equalTo(titleImageView.snp_bottom).offset(25)
            } else {
                make.width.equalTo(320)
                make.height.equalTo(240)
                make.top.equalTo(titleImageView.snp_bottom).offset(30)
            }
        }
        accountLabel.snp_makeConstraints { (make) in
            make.left.equalTo(loginView).offset(25)
            if isiPhone5s {
                make.top.equalTo(loginView).offset(40)
            } else {
                make.top.equalTo(loginView).offset(60)
            }
            make.width.equalTo(40)
            make.height.equalTo(13)
        }
        accountTextField.snp_makeConstraints { (make) in
            make.left.equalTo(accountLabel.snp_right).offset(5)
            if isiPhone5s {
                make.top.equalTo(loginView).offset(38)
            } else {
                make.top.equalTo(loginView).offset(50)
            }
            
            make.right.equalTo(loginView).offset(-30)
            make.height.equalTo(31)
        }
        passwordLabel.snp_makeConstraints { (make) in
            make.left.equalTo(loginView).offset(25)
            make.top.equalTo(accountLabel.snp_bottom).offset(30)
            make.width.equalTo(40)
            make.height.equalTo(13)
        }
        passwordTextField.snp_makeConstraints { (make) in
            make.left.equalTo(passwordLabel.snp_right).offset(5)
            make.top.equalTo(accountTextField.snp_bottom).offset(12)
            make.right.equalTo(loginView).offset(-30)
            make.height.equalTo(31)
        }
        rememberBtn.snp_makeConstraints { (make) in
            make.left.equalTo(loginView).offset(70)
            make.top.equalTo(passwordTextField.snp_bottom).offset(10)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        rememberLabel.snp_makeConstraints { (make) in
            make.left.equalTo(rememberBtn.snp_right).offset(3)
            make.top.equalTo(passwordTextField.snp_bottom).offset(10)
            make.width.equalTo(56)
            make.height.equalTo(14)
        }
        forgetButton.snp_makeConstraints { (make) in
            make.right.equalTo(loginView.snp_right).offset(-70)
            make.top.equalTo(passwordTextField.snp_bottom).offset(10)
            make.width.equalTo(56)
            make.height.equalTo(14)
        }
        btnBackView.snp_makeConstraints { (make) in
            make.centerX.equalTo(loginView)
            make.height.equalTo(30)
            make.width.equalTo(180)
            make.top.equalTo(forgetButton.snp_bottom).offset(20)
        }
        loginBtn.snp_makeConstraints { (make) in
            make.left.equalTo(btnBackView).offset(0)
            make.top.equalTo(btnBackView).offset(0)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        registerBtn.snp_makeConstraints { (make) in
            make.right.equalTo(btnBackView.snp_right).offset(0)
            make.top.equalTo(btnBackView).offset(0)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }
    
    func initHelper() {
        loginHelper = LoginViewControllerHelper()
        
        loginHelper?.loginManager?.showHUDView = self.view
        loginHelper?.loginViewController = self
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
    
    // MARK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.userInteractionEnabled = true
            _backImageView.image = UIImage(named: "loginandregister_bakground_pic_iphone")
        }
        return _backImageView
    }
    
    var _titleImageView: UIImageView!
    var titleImageView: UIImageView {
        if _titleImageView == nil {
            _titleImageView = UIImageView()
            _titleImageView.image = UIImage(named: "LoginAndRegister_title_icon_normal_iPhone")
        }
        return _titleImageView
    }

    var _loginView: UIImageView!
    var loginView: UIImageView {
        if _loginView == nil {
            _loginView = UIImageView()
            _loginView.userInteractionEnabled = true
            _loginView.image = UIImage(named: "loginandregister_boderbg_pic_iphone")
        }
        return _loginView
    }
   
    var _accountLabel: UILabel!
    var accountLabel: UILabel {
        if _accountLabel == nil {
            _accountLabel = UILabel()
            _accountLabel.text = "账号："
            _accountLabel.font = UIFont.systemFontOfSize(13)
            _accountLabel.textColor = UIColor(red: 161/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1)
        }
        return _accountLabel
    }
    
    var _passwordLabel: UILabel!
    var passwordLabel: UILabel {
        if _passwordLabel == nil {
            _passwordLabel = UILabel()
            _passwordLabel.text = "密码："
            _passwordLabel.font = UIFont.systemFontOfSize(13)
            _passwordLabel.textColor = UIColor(red: 161/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1)
        }
        return _passwordLabel
    }
    
    var _accountTextField: UITextField!
    var accountTextField: UITextField {
        if _accountTextField == nil {
            _accountTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _accountTextField.placeholder = "请输入您的账号/手机号"
            _accountTextField.font = UIFont.systemFontOfSize(13)
            _accountTextField.userInteractionEnabled = true
            _accountTextField.clearButtonMode = .WhileEditing
            _accountTextField.delegate = self
        }
        return _accountTextField
    }
    
    
    
    var _passwordTextField: UITextField!
    var passwordTextField: UITextField {
        if _passwordTextField == nil {
            _passwordTextField = InputBoxView(showLeftView: false, showLeftBank: true)
            _passwordTextField.borderStyle = .None
            _passwordTextField.font = UIFont.systemFontOfSize(13)
            _passwordTextField.userInteractionEnabled = true
            _passwordTextField.placeholder = "请输入您的密码"
            _passwordTextField.secureTextEntry = true
            _passwordTextField.clearButtonMode = .WhileEditing
            _passwordTextField.delegate = self
        }
        return _passwordTextField
    }
    
    var _rememberBtn: UIButton!
    var rememberBtn: UIButton {
        if _rememberBtn == nil {
            _rememberBtn = UIButton()
            _rememberBtn.setBackgroundImage(UIImage(named: "loginandregister_checkbox_icon_normal_iphone"), forState: .Normal)
            _rememberBtn.addTarget(self, action: #selector(LoginViewController.rememberPasswordAction(_:)), forControlEvents: .TouchUpInside)
        }
        return _rememberBtn
    }
    
    var _rememberLabel: UILabel!
    var rememberLabel: UILabel {
        if _rememberLabel == nil {
            _rememberLabel = UILabel()
            _rememberLabel.text = "记住密码"
            _rememberLabel.font = UIFont.boldSystemFontOfSize(14)
            _rememberLabel.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
        }
        return _rememberLabel
    }
    
    var _forgetButton: UIButton!
    var forgetButton: UIButton {
        if _forgetButton == nil {
            _forgetButton = UIButton()
            
            let str = NSMutableAttributedString(string: "忘记密码")
            let strRange = NSRange.init(location: 0, length: str.length)
            str.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(integer: NSUnderlineStyle.StyleSingle.rawValue), range: strRange)
            str.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 161/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1), range: strRange)
            str.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(14), range: strRange)
            _forgetButton.setAttributedTitle(str, forState: .Normal)
            _forgetButton.addTarget(self, action: #selector(LoginViewController.forgetPasswordAction(_:)), forControlEvents: .TouchUpInside)
        }
        return _forgetButton
    }
    
    var _btnBackView: UIView!
    var btnBackView: UIView {
        if _btnBackView == nil {
            _btnBackView = UIView()
            _btnBackView.userInteractionEnabled = true
            _btnBackView.backgroundColor = UIColor.clearColor()
        }
        return _btnBackView
    }
    
    var _loginBtn: UIButton!
    var loginBtn: UIButton {
        if _loginBtn == nil {
            _loginBtn = UIButton()
            _loginBtn.userInteractionEnabled = true
            _loginBtn.setBackgroundImage(UIImage(named: "loginandregister_login_btn_normal_iphone"), forState: .Normal)
            _loginBtn.addTarget(self, action: #selector(LoginViewController.loginAction(_:)), forControlEvents: .TouchUpInside)
        }
        return _loginBtn
    }
    
    var _registerBtn: UIButton!
    var registerBtn: UIButton {
        if _registerBtn == nil {
            _registerBtn = UIButton()
            _registerBtn.userInteractionEnabled = true
            _registerBtn.setBackgroundImage(UIImage(named: "loginandregister_regist_btn_normal_iphone"), forState: .Normal)
            _registerBtn.addTarget(self, action: #selector(LoginViewController.registerAction(_:)), forControlEvents: .TouchUpInside)
        }
        return _registerBtn
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (textField.text! as NSString).length > 10 && string != "" {
            return false
        }
        return true
    }
}

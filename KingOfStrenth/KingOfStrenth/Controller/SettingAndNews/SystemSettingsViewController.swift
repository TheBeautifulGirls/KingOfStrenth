//
//  SystemSettingsViewController.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class SystemSettingsViewController: UIViewController {

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        
        initLayout()
        layoutPageSubViews()
    }
    
    // MARK: - private method
    func initLayout() {
        self.view.addSubview(logoutBtn)
        
    }
    
    func layoutPageSubViews() {
        logoutBtn.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.snp_bottom).offset(-30)
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
    }
    
    func logoutAction(sender: UIButton) {
        YAlertViewController.showAlertControllerCompleion({
            
            let userDetault = NSUserDefaults.standardUserDefaults()
            userDetault.removeObjectForKey("This is userInfo")
            userDetault.synchronize()
            
            let loginVC = LoginViewController()
            self.navigationController?.pushViewController(loginVC, animated: false)
            
            }, view: self, title: "提示", message: "确定要退出吗？")
    }
    
    // MARK: - setters and getters
    var _logoutBtn: UIButton!
    var logoutBtn: UIButton {
        if _logoutBtn == nil {
            _logoutBtn = UIButton()
            _logoutBtn.setBackgroundImage(UIImage(named: "Setting_cancelAccount_btn_normal_iPhone"), forState: .Normal)
            _logoutBtn.setBackgroundImage(UIImage(named: "Setting_cancelAccount_btn_selected_iPhone"), forState: .Highlighted)
            _logoutBtn.addTarget(self, action: #selector(SystemSettingsViewController.logoutAction(_:)), forControlEvents: .TouchUpInside)
        }
        return _logoutBtn
    }
    

}

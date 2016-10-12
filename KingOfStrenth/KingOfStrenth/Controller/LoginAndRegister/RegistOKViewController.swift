//
//  RegistOKViewController.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/10/11.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import UIKit

class RegistOKViewController: BaseViewController {
    
    //MARK: -- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        layoutPageSubViews()
    }
    
    //MARK: -- event method
    func enter(sender: UIButton){
        let vc = LoginViewController()
//        vc.tag = 1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: -- private method
    func initBaseLayout() {
        self.view.backgroundColor = UIColor(hexString: "#FBE8B6")
        initNavigationBar("navgationbar_register_btn_normal_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(bgImageView)
        bgImageView.addSubview(enterButton)
    }
    func layoutPageSubViews() {
        bgImageView.snp_makeConstraints { (make) in
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.view).offset(54)
            make.bottom.equalTo(self.view).offset(-15)
            make.centerX.equalTo(self.view)
        }
        enterButton.snp_makeConstraints { (make) in
            make.right.equalTo(bgImageView.snp_right).offset(-50)
            make.bottom.equalTo(bgImageView.snp_bottom).offset(-15)
            make.height.equalTo(35)
            make.width.equalTo(105)
        }
    }
    
    //MAKK: -- setter getter
    var _bgImageView: UIImageView!
    var bgImageView: UIImageView {
        if _bgImageView == nil {
            _bgImageView = UIImageView()
            _bgImageView.userInteractionEnabled = true
            _bgImageView.image = UIImage(named: "LoginAndRegister_registerSuccess_icon_normal_iphone")
        }
        return _bgImageView
    }
    var _enterButton: UIButton!
    var enterButton: UIButton {
        if _enterButton == nil {
            _enterButton = UIButton(type: .Custom)
            _enterButton.setImage(UIImage(named: "LoginAndRegister_enter_btn_normal_iPhone"), forState: .Normal)
            _enterButton.setImage(UIImage(named: "LoginAndRegister_enter_btn_selected_iPhone"), forState: .Highlighted)
            _enterButton.addTarget(self, action: #selector(RegistOKViewController.enter(_:)), forControlEvents: .TouchUpInside)
        }
        return _enterButton
    }
    
}
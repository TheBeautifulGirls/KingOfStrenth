//
//  GuoZiJianViewController.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/11.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class GuoZiJianViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBaseLayout()
        layoutPageSubViews()
    }

    func initBaseLayout() {
        initNavigationBar("navigationbar_imperialCollege_icon_normol_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(backImageView)
        backImageView.addSubview(rightImageView)
        backImageView.addSubview(mathBtn)
        backImageView.addSubview(physicsBtn)
        backImageView.addSubview(chemistryBtn)
        backImageView.addSubview(englishBtn)
        backImageView.addSubview(chineseBtn)
        rightImageView.addSubview(synchronizedVideoBtn)
        rightImageView.addSubview(topicVideoBtn)
        rightImageView.addSubview(synchronizedVideoImage)
        rightImageView.addSubview(middleTopicVideoImage)
    }
    
    // MARK: - private cycle
    func layoutPageSubViews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(44, 0, 0, 0))
        }
        rightImageView.snp_makeConstraints { (make) in
            make.top.equalTo(backImageView.snp_top).offset(0)
            make.right.equalTo(backImageView.snp_right).offset(0)
            make.bottom.equalTo(backImageView.snp_bottom).offset(0)
            make.left.equalTo(backImageView.snp_left).offset(140/736*WIDTH)
        }
        mathBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(backImageView.snp_top).offset(18/414*HEIGHT)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        physicsBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(mathBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        chemistryBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(physicsBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        englishBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(chemistryBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        chineseBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(englishBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        synchronizedVideoBtn.snp_makeConstraints { (make) in
            make.left.equalTo(rightImageView.snp_left).offset(130/736*WIDTH)
            make.top.equalTo(rightImageView.snp_top).offset(70/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(120/414*HEIGHT)
        }
        
        topicVideoBtn.snp_makeConstraints { (make) in
            make.left.equalTo(synchronizedVideoBtn.snp_right).offset(120/736*WIDTH)
            make.top.equalTo(rightImageView.snp_top).offset(70/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(120/414*HEIGHT)
        }
        
        synchronizedVideoImage.snp_makeConstraints { (make) in
            make.left.equalTo(rightImageView.snp_left).offset(120/736*WIDTH)
            make.top.equalTo(synchronizedVideoBtn.snp_bottom).offset(20/414*HEIGHT)
            make.width.equalTo(130/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        middleTopicVideoImage.snp_makeConstraints { (make) in
            make.left.equalTo(synchronizedVideoBtn.snp_right).offset(90/736*WIDTH)
            make.top.equalTo(topicVideoBtn.snp_bottom).offset(20/414*HEIGHT)
            make.width.equalTo(180/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
    }
    
    // MARK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.userInteractionEnabled = true
            _backImageView.image = UIImage(named: "Archives_BackGround_icon_iPhone")
        }
        return _backImageView
    }
    
    var _rightImageView: UIImageView!
    var rightImageView: UIImageView {
        if _rightImageView == nil {
            _rightImageView = UIImageView()
            _rightImageView.userInteractionEnabled = true
            _rightImageView.image = UIImage(named: "ImperialCollege_Chinesebg_icon_normol_iPhone")
        }
        return _rightImageView
    }
    
    var _mathBtn: UIButton!
    var mathBtn: UIButton {
        if _mathBtn == nil {
            _mathBtn = UIButton()
            _mathBtn.setBackgroundImage(UIImage(named: "couse_Math_btn_normal_iPhone"), forState: .Normal)
            _mathBtn.setBackgroundImage(UIImage(named: "couse_Math_btn_selected_iPhone"), forState: .Selected)
            _mathBtn.addTarget(self, action: #selector(GuoZiJianViewController.mathBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _mathBtn
    }
    
    var _physicsBtn: UIButton!
    var physicsBtn: UIButton {
        if _physicsBtn == nil {
            _physicsBtn = UIButton()
            _physicsBtn.setBackgroundImage(UIImage(named: "couse_Physics_btn_normal_iPhone"), forState: .Normal)
            _physicsBtn.setBackgroundImage(UIImage(named: "couse_Physics_btn_selected_iPhone"), forState: .Selected)
            _physicsBtn.addTarget(self, action: #selector(GuoZiJianViewController.physicsBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _physicsBtn
    }
    
    var _chemistryBtn: UIButton!
    var chemistryBtn: UIButton {
        if _chemistryBtn == nil {
            _chemistryBtn = UIButton()
            _chemistryBtn.setBackgroundImage(UIImage(named: "couse_Chemical_btn_normal_iPhone"), forState: .Normal)
            _chemistryBtn.setBackgroundImage(UIImage(named: "couse_Chemical_btn_selected_iPhone"), forState: .Selected)
            _chemistryBtn.addTarget(self, action: #selector(GuoZiJianViewController.chemistryBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _chemistryBtn
    }
    
    var _englishBtn: UIButton!
    var englishBtn: UIButton {
        if _englishBtn == nil {
            _englishBtn = UIButton()
            _englishBtn.setBackgroundImage(UIImage(named: "couse_English_btn_normal_iPhone"), forState: .Normal)
            _englishBtn.setBackgroundImage(UIImage(named: "couse_English_btn_selected_iPhone"), forState: .Selected)
            _englishBtn.addTarget(self, action: #selector(GuoZiJianViewController.englishBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _englishBtn
    }
    
    var _chineseBtn: UIButton!
    var chineseBtn: UIButton {
        if _chineseBtn == nil {
            _chineseBtn = UIButton()
            _chineseBtn.setBackgroundImage(UIImage(named: "couse_Chinese_btn_normal_iPhone"), forState: .Normal)
            _chineseBtn.setBackgroundImage(UIImage(named: "couse_Chinese_btn_selected_iPhone"), forState: .Selected)
            _chineseBtn.addTarget(self, action: #selector(GuoZiJianViewController.chineseBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _chineseBtn
    }
    
    var _synchronizedVideoBtn: UIButton!
    var synchronizedVideoBtn: UIButton {
        if _synchronizedVideoBtn == nil {
            _synchronizedVideoBtn = UIButton()
            _synchronizedVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_synchronizedVideo_btn_normol_iPhone"), forState: .Normal)
            _synchronizedVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_synchronizedVideo_btn_selected_iPhone"), forState: .Highlighted)
        }
        return _synchronizedVideoBtn
    }
    
    var _topicVideoBtn: UIButton!
    var topicVideoBtn: UIButton {
        if _topicVideoBtn == nil {
            _topicVideoBtn = UIButton()
            _topicVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_topicVideo_btn_normol_iPhone"), forState: .Normal)
            _topicVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_topicVideo_btn_selected_iPhone"), forState: .Highlighted)
        }
        return _topicVideoBtn
    }
    
    var _synchronizedVideoImage: UIImageView!
    var synchronizedVideoImage: UIImageView {
        if _synchronizedVideoImage == nil {
            _synchronizedVideoImage = UIImageView()
            _synchronizedVideoImage.image = UIImage(named: "ImperialCollege_synchronizedVideo_icon_normol_iPhone")
        }
        return _synchronizedVideoImage
    }
    
    var _middleTopicVideoImage: UIImageView!
    var middleTopicVideoImage: UIImageView {
        if _middleTopicVideoImage == nil {
            _middleTopicVideoImage = UIImageView()
            _middleTopicVideoImage.image = UIImage(named: "ImperialCollege_middleTopicVideo_icon_normol_iPhone")
        }
        return _middleTopicVideoImage
    }
    
//    ImperialCollege_synchronizedVideo_icon_normol_iPhone
//    ImperialCollege_middleTopicVideo_icon_normol_iPhone
    
    //MARK: - event response
    func mathBtnClick(sender:AnyObject) {
        mathBtn.selected = true
        physicsBtn.selected = false
        chemistryBtn.selected = false
        englishBtn.selected = false
        chineseBtn.selected = false
    }
    
    func physicsBtnClick(sender:AnyObject) {
        physicsBtn.selected = true
        mathBtn.selected = false
        chemistryBtn.selected = false
        englishBtn.selected = false
        chineseBtn.selected = false
    }
    
    func chemistryBtnClick(sender:AnyObject) {
        chemistryBtn.selected = true
        mathBtn.selected = false
        physicsBtn.selected = false
        englishBtn.selected = false
        chineseBtn.selected = false
    }
    
    func englishBtnClick(sender:AnyObject) {
        englishBtn.selected = true
        chemistryBtn.selected = false
        mathBtn.selected = false
        physicsBtn.selected = false
        chineseBtn.selected = false
    }
    
    func chineseBtnClick(sender:AnyObject) {
        chineseBtn.selected = true
        englishBtn.selected = false
        chemistryBtn.selected = false
        mathBtn.selected = false
        physicsBtn.selected = false
    }
}

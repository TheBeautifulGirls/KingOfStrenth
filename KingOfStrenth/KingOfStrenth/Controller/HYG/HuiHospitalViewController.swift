//
//  HuiHospitalViewController.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/10/12.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import UIKit

class HuiHospitalViewController: BaseViewController {
    
    //学段
    var phase: String?
    //科目
    var subject: String?
    //标记
    
    //MARK: -- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initHelper()
        
        initBaseLayout()
        layoutPageSubViews()
    }
    //MARK: -- event response
    func selectCourse(sender: UIButton) {
        for i in 1...6 {
            let button = self.view.viewWithTag(i + 100) as! UIButton
            if sender.tag == i + 100 {
                button.selected = true
            } else {
                button.selected = false
            }
        }
        if englishBtn.selected == true || chineseBtn.selected == true  {
            backImageView.image = UIImage(named: "HuiHospital_background_iPhone")
            knowledgeBtn.hidden = true
            testCenterBtn.hidden = true
        } else {
            backImageView.image = UIImage(named: "Archives_BackGround_icon_iPhone")
            knowledgeBtn.hidden = false
            testCenterBtn.hidden = false
        }
    }
    func selectKnowledge(sender: UIButton) {
        let knowledgeVC = KnowledgeViewController()
        self.navigationController?.pushViewController(knowledgeVC, animated: false)
    }
    //MARK: -- private method
    func initBaseLayout() {
        initNavigationBar("HuiHospital_navbahospital_title_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(backImageView)
        backImageView.addSubview(mathBtn)
        backImageView.addSubview(physicsBtn)
        backImageView.addSubview(chemistryBtn)
        backImageView.addSubview(biologyBtn)
        backImageView.addSubview(englishBtn)
        backImageView.addSubview(chineseBtn)
        if englishBtn.selected == true || chineseBtn.selected == true {
            
        } else {
            backImageView.addSubview(knowledgeBtn)
            backImageView.addSubview(testCenterBtn)
        }
        
    }
    func layoutPageSubViews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(44, 0, 0, 0))
        }
        mathBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
            make.top.equalTo(backImageView.snp_top).offset(18/414*SCREEN_HEIGHT)
            make.width.equalTo(135/736*SCREEN_WIDTH)
            make.height.equalTo(48/414*SCREEN_HEIGHT)
        }
        physicsBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
            make.top.equalTo(mathBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*SCREEN_WIDTH)
            make.height.equalTo(48/414*SCREEN_HEIGHT)
        }
        chemistryBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
            make.top.equalTo(physicsBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*SCREEN_WIDTH)
            make.height.equalTo(48/414*SCREEN_HEIGHT)
        }
        biologyBtn.snp_makeConstraints { (make) in
            if phase == "2" {
                make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
                make.top.equalTo(physicsBtn.snp_bottom).offset(0)
                make.height.equalTo(0)
            } else if phase == "3"{
                make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
                make.top.equalTo(physicsBtn.snp_bottom).offset(0)
                make.width.equalTo(135/736*SCREEN_WIDTH)
                make.height.equalTo(48/414*SCREEN_HEIGHT)
            }
        }
        englishBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
            make.top.equalTo(chemistryBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*SCREEN_WIDTH)
            make.height.equalTo(48/414*SCREEN_HEIGHT)
        }
        chineseBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*SCREEN_WIDTH)
            make.top.equalTo(englishBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*SCREEN_WIDTH)
            make.height.equalTo(48/414*SCREEN_HEIGHT)
        }
        
        knowledgeBtn.snp_makeConstraints { (make) in
            make.left.equalTo(chemistryBtn.snp_right).offset(80/736*SCREEN_WIDTH)
            make.top.equalTo(self.view).offset(154/414*SCREEN_HEIGHT)
            make.width.equalTo(190/736*SCREEN_WIDTH)
            make.height.equalTo(170/414*SCREEN_HEIGHT)
        }
        testCenterBtn.snp_makeConstraints { (make) in
            make.left.equalTo(knowledgeBtn.snp_right).offset(60/736*SCREEN_WIDTH)
            make.top.equalTo(self.view).offset(154/414*SCREEN_HEIGHT)
            make.width.equalTo(190/736*SCREEN_WIDTH)
            make.height.equalTo(170/414*SCREEN_HEIGHT)
        }
    }
    func initHelper() {
        //默认数学为选中状态
        mathBtn.selected = true
        phase = NSUserDefaults.standardUserDefaults().objectForKey("userPhase") as? String
    }
    
    // MARK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.userInteractionEnabled = true
            if englishBtn.selected == true || chineseBtn.selected == true {
                _backImageView.image = UIImage(named: "HuiHospital_background_iPhone")
            } else {
                _backImageView.image = UIImage(named: "Archives_BackGround_icon_iPhone")
            }
        }
        return _backImageView
    }
    
    var _mathBtn: UIButton!
    var mathBtn: UIButton {
        if _mathBtn == nil {
            _mathBtn = UIButton()
            _mathBtn.tag = 101
            _mathBtn.setBackgroundImage(UIImage(named: "couse_Math_btn_normal_iPhone"), forState: .Normal)
            _mathBtn.setBackgroundImage(UIImage(named: "couse_Math_btn_selected_iPhone"), forState: .Selected)
            _mathBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectCourse(_:)), forControlEvents: .TouchUpInside)
        }
        return _mathBtn
    }
    
    var _physicsBtn: UIButton!
    var physicsBtn: UIButton {
        if _physicsBtn == nil {
            _physicsBtn = UIButton()
            _physicsBtn.tag = 102
            _physicsBtn.setBackgroundImage(UIImage(named: "couse_Physics_btn_normal_iPhone"), forState: .Normal)
            _physicsBtn.setBackgroundImage(UIImage(named: "couse_Physics_btn_selected_iPhone"), forState: .Selected)
            _physicsBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectCourse(_:)), forControlEvents: .TouchUpInside)
            
        }
        return _physicsBtn
    }
    
    var _chemistryBtn: UIButton!
    var chemistryBtn: UIButton {
        if _chemistryBtn == nil {
            _chemistryBtn = UIButton()
            _chemistryBtn.tag = 103
            _chemistryBtn.setBackgroundImage(UIImage(named: "couse_Chemical_btn_normal_iPhone"), forState: .Normal)
            _chemistryBtn.setBackgroundImage(UIImage(named: "couse_Chemical_btn_selected_iPhone"), forState: .Selected)
            _chemistryBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectCourse(_:)), forControlEvents: .TouchUpInside)
        }
        return _chemistryBtn
    }
    
    var _biologyBtn: UIButton!
    var biologyBtn: UIButton {
        if _biologyBtn == nil {
            _biologyBtn = UIButton(type: .Custom)
            _biologyBtn.tag = 104
            _biologyBtn.setBackgroundImage(UIImage(named: "couse_Biology_btn_normal_iPhone"), forState: .Normal)
            _biologyBtn.setBackgroundImage(UIImage(named: "couse_Biology_btn_selected_iPhone"), forState: .Selected)
            _biologyBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectCourse(_:)), forControlEvents: .TouchUpInside)
        }
        return _biologyBtn
    }
    
    var _englishBtn: UIButton!
    var englishBtn: UIButton {
        if _englishBtn == nil {
            _englishBtn = UIButton()
            _englishBtn.tag = 105
            _englishBtn.setBackgroundImage(UIImage(named: "couse_English_btn_normal_iPhone"), forState: .Normal)
            _englishBtn.setBackgroundImage(UIImage(named: "couse_English_btn_selected_iPhone"), forState: .Selected)
            _englishBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectCourse(_:)), forControlEvents: .TouchUpInside)
            
        }
        return _englishBtn
    }
    
    var _chineseBtn: UIButton!
    var chineseBtn: UIButton {
        if _chineseBtn == nil {
            _chineseBtn = UIButton()
            _chineseBtn.tag = 106
            _chineseBtn.setBackgroundImage(UIImage(named: "couse_Chinese_btn_normal_iPhone"), forState: .Normal)
            _chineseBtn.setBackgroundImage(UIImage(named: "couse_Chinese_btn_selected_iPhone"), forState: .Selected)
            _chineseBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectCourse(_:)), forControlEvents: .TouchUpInside)
        }
        return _chineseBtn
    }
    
    var _knowledgeBtn: UIButton!
    var knowledgeBtn: UIButton {
        if _knowledgeBtn == nil {
            _knowledgeBtn = UIButton(type: .Custom)
            _knowledgeBtn.setBackgroundImage(UIImage(named: "HuiHospital_knowledgepointdia_btn_normal_iPhone"), forState: .Normal)
            _knowledgeBtn.setBackgroundImage(UIImage(named: "HuiHospital_knowledgepointdia_btn_selected_iPhone"), forState: .Highlighted)
            _knowledgeBtn.addTarget(self, action: #selector(HuiHospitalViewController.selectKnowledge(_:)), forControlEvents: .TouchUpInside)
        }
        return _knowledgeBtn
    }
    
    var _testCenterBtn: UIButton!
    var testCenterBtn: UIButton {
        if _testCenterBtn == nil {
            _testCenterBtn = UIButton(type: .Custom)
            _testCenterBtn.setBackgroundImage(UIImage(named: "HuiHospital_testcenter_btn_normal_iPhone"), forState: .Normal)
            _testCenterBtn.setBackgroundImage(UIImage(named: "HuiHospital_testcenter_btn_selected_iPhone"), forState: .Highlighted)
            
        }
        return _testCenterBtn
    }
    
}

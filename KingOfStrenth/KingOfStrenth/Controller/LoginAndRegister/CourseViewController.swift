//
//  CourseViewController.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class CourseViewController: BaseViewController {
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        
    }
    
    //MARK: - private method
    func initBaseLayout() {
     
        self.view.backgroundColor = UIColor(hexString: "#FBE8B6")
        initNavigationBar("", showLeft: true, showRight: false)
    }
    func layoutPageSubViews() {
        
    }
    
    //MARK: - setter and getter
    var _bgView: UIView!
    var bgView: UIView {
        if _bgView == nil {
            _bgView = UIView()
            _bgView.backgroundColor = UIColor.redColor()
        }
        return _bgView
    }
    var _chooseVersionImage: UIImageView!
    var chooseVersionImage: UIImageView {
        if _chooseVersionImage == nil {
            _chooseVersionImage = UIImageView()
            _chooseVersionImage.image = UIImage(named: "LoginAndRegister_chooseVersion_icon_normal_iPhone")
        }
        return _chooseVersionImage
    }
    var _mathButton: UIButton!
    var mathButton: UIButton {
        if _mathButton == nil {
            _mathButton = UIButton(type: .Custom)
            _mathButton.setImage(UIImage(named: "Common_Math_btn_normal_iPhone"), forState: .Normal)
            _mathButton.setImage(UIImage(named: "Common_Math_btn_selected_iPhone"), forState: .Selected)
        }
        return _mathButton
    }
    var _chineseButton: UIButton!
    var chineseButton: UIButton {
        if _chineseButton == nil {
            _chineseButton = UIButton(type: .Custom)
            _chineseButton.setImage(UIImage(named: "Common_Chinese_btn_normal_iPhone"), forState: .Normal)
            _chineseButton.setImage(UIImage(named: "Common_Chinese_btn_selected_iPhone"), forState: .Selected)
        }
        return _chineseButton
    }
    var _englishButton: UIButton!
    var englishButton: UIButton {
        if _englishButton == nil {
            _englishButton = UIButton(type: .Custom)
            _englishButton.setImage(UIImage(named: "Common_English_btn_normal_iPhone"), forState: .Normal)
            _englishButton.setImage(UIImage(named: "Common_English_btn_selected_iPhone"), forState: .Selected)
        }
        return _englishButton
    }
    var _physicsButton: UIButton!
    var physicsButton: UIButton {
        if _physicsButton == nil {
            _physicsButton = UIButton(type: .Custom)
            _physicsButton.setImage(UIImage(named: "Common_Physics_btn_normal_iPhone"), forState: .Normal)
            _physicsButton.setImage(UIImage(named: "Common_Physics_btn_selected_iPhone"), forState: .Selected)
        }
        return _physicsButton
    }
    var _chemicalButton: UIButton!
    var chemicalButton:UIButton {
        if _chemicalButton == nil {
            _chemicalButton = UIButton(type: .Custom)
            _chemicalButton.setImage(UIImage(named: "Common_Chemical_btn_normal_iPhone"), forState: .Normal)
            _chemicalButton.setImage(UIImage(named: "Common_Chemical_btn_selected_iPhone"), forState: .Selected)
        }
        return _chemicalButton
    }
    
    var _biologyButton: UIButton!
    var biologyButton: UIButton {
        if _biologyButton == nil {
            _biologyButton = UIButton(type: .Custom)
            _biologyButton.setImage(UIImage(named: "Common_Biology_btn_normal_iPhone"), forState: .Normal)
            _biologyButton.setImage(UIImage(named: "Common_Biology_btn_selected_iPhone"), forState: .Selected)
        }
        return _biologyButton
    }
    
    
    
    
}

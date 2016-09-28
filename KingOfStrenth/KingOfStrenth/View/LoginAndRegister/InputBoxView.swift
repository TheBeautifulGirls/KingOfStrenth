//
//  InputBoxView.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/26.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit


class InputBoxView: UITextField {
    
    // MARK: - lifi cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(showLeftView: Bool, showLeftBank: Bool) {
        self.init()
        
        self.showLeftView = showLeftView
        self.showLeftBank = showLeftBank
        initBaseLayout()
        layoutPageSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - private method
    // 界面初始化
    func initBaseLayout() {
        
        self.background = UIImage(named: "loginandregister_inputbg_pic_iphone")
        self.leftViewMode = .Always
        self.rightViewMode = .Never
        self.clearButtonMode = .WhileEditing
        self.returnKeyType = .Done
        
        if showLeftView {
            self.leftView = left
            left.addSubview(leftImageView)
        } else if showLeftBank {
            self.leftView = bankView
        }
    }
    // 界面布局
    func layoutPageSubViews() {
        
        if showLeftView {
            leftImageView.snp_makeConstraints { (make) in
                make.left.equalTo(left).offset(12)
                make.centerY.equalTo(left)
                make.width.equalTo(15)
                make.height.equalTo(20)
            }
        }
    }
    
    // MARK: - setters and getters
    var _left: UIView!
    var left: UIView {
        if _left == nil {
            _left = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: CGRectGetHeight(self.frame)))
            _left.backgroundColor = UIColor.clearColor()
        }
        return _left
    }
    
    var _leftImageView: UIImageView!
    var leftImageView: UIImageView {
        if _leftImageView == nil {
            _leftImageView = UIImageView()
            _leftImageView.contentMode = .ScaleAspectFit
        }
        
        return _leftImageView
    }
    
    var _right: UIView!
    var right: UIView {
        if _right == nil {
            _right = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 92))
            _right.backgroundColor = UIColor.clearColor()
        }
        return _right
    }
    
    var _bottomLine: UIImageView!
    var bottomLine: UIImageView {
        if _bottomLine == nil {
            _bottomLine = UIImageView()
            _bottomLine.backgroundColor = UIColor(red: 215/255.0, green: 215/255.0, blue: 215/255.0, alpha: 1)
        }
        return _bottomLine
    }
    
    var _bankView: UIView!
    var bankView: UIView {
        if _bankView == nil {
            _bankView = UIView()
            _bankView.backgroundColor = UIColor.clearColor()
            _bankView.frame = CGRect(x: 0, y: 0, width: 5, height: CGRectGetHeight(self.frame))
        }
        return _bankView
    }
    
    var showLeftView: Bool = false
    var showLeftBank: Bool = true
    
}

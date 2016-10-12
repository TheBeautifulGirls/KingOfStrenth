//
//  DetailMessageViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/10/10.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class DetailMessageViewController: BaseViewController {

    var content: String?
    var id: String?
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initBaseLayout()
        layoutPageSubviews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - private method
    func initBaseLayout() {
        self.view.addSubview(backImageView)
        self.view.addSubview(contentTextView)
        initNavigationBar("navgationbar_Message_icon_normal_iPhone", showLeft: true, showRight: false)
    }
    
    func layoutPageSubviews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        contentTextView.snp_makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.view).offset(66)
            make.bottom.equalTo(self.view).offset(-15)
        }
    }
    
    // MARAK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.image = UIImage(named: "Message_backgroung_icon_normal_iPhone")
        }
        return _backImageView
    }

    var _contentTextView: UITextView!
    var contentTextView: UITextView {
        if _contentTextView == nil {
            _contentTextView = UITextView()
            _contentTextView.text = content
            _contentTextView.font = UIFont.systemFontOfSize(14)
        }
        return _contentTextView
    }

}

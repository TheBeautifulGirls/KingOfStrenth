//
//  ServicesViewController.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class ServicesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        initBaseLayout()
        layoutPageSubViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initBaseLayout() {
        self.view.backgroundColor = UIColor(hexString: "#FBE8B6")
        initNavigationBar("navigationbar_Services_icon_normal_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(backgroundImage)
    }
    
    func layoutPageSubViews() {
          backgroundImage.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top).offset(80/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(200/736*WIDTH)
            make.width.equalTo(320/736*WIDTH)
            make.height.equalTo(270/414*HEIGHT)
        }

    }
    
    var _backgroundImage:UIImageView!
    var backgroundImage:UIImageView {
        if _backgroundImage == nil {
            _backgroundImage = UIImageView()
            _backgroundImage.image = UIImage(named: "Services_contactText_icon_normal_iPhone")
        }
        return _backgroundImage
    }
}

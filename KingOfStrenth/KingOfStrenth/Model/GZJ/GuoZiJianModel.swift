//
//  GuoZiJianModel.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SwiftyJSON

class GuoZiJianModel: NSObject {
    //语文视频名称
    var name: String?
    var dataSource: JSON?
    
    override init() {
        super.init()
    }
    
    init(dataSource: JSON) {
        self.dataSource = dataSource
    }
}


//
//  MenuModel.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class MenuModel: NSObject {
    //用户Id
    var userId: String?
    
    override init() {
        super.init()
    }
    
    init(userId: String) {
        
        self.userId = userId
    }
}

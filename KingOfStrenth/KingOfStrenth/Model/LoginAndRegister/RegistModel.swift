//
//  RegistModel.swift
//  KingOfStrenth
//
//  Created by ShuYan Feng on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation

class RegistModel: NSObject {
    
    //学段
    var phase: String?
    //用户名
    var userName: String?
    //用户ID
    var userID: String?
    //密码
    var password: String?
    //手机号
    var phoneNumber: String?
    // 验证码
    var code: String?
    
    override init() {
        super.init()
    }
    init(userID: String) {
        self.userID = userID
    }
}
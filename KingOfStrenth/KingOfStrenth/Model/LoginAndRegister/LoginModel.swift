//
//  LoginModel.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/26.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class LoginModel: NSObject {
    // 用户名
    var userName: String?
    // 密码
    var password: String?
    // 用户Id
    var userId: String?
    // 设备Id
    var channelId: String?
    // 学段
    var xueduan: String?
    // 城市
    var city: String?
    // 学生手机号
    var studentPhone: String?
    // 家长手机号
    var parentPhone: String?
    // 学校id
    var schoolId: String?
    // 学生姓名
    var studentName: String?
    
    override init() {
        super.init()
    }
    
    init(studentName: String, userId: String, xueduan: String, city: String, studentPhone: String, parentPhone: String, schoolId: String) {
        self.studentName = studentName
        self.userId = userId
        self.xueduan = xueduan
        self.city = city
        self.studentPhone = studentPhone
        self.parentPhone = parentPhone
        self.schoolId = schoolId
    }
    
    // 解档归档，用NSUserdefault本地存储model
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.userId = aDecoder.decodeObjectForKey("userId") as? String
        self.userName = aDecoder.decodeObjectForKey("userName") as? String
        self.password = aDecoder.decodeObjectForKey("password") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.userId, forKey: "userId")
        aCoder.encodeObject(self.userName, forKey: "userName")
        aCoder.encodeObject(self.password, forKey: "password")
    }
}

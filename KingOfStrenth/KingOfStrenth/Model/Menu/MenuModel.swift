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
    //用户真实姓名
    var stuName: String?
    //用户学校
    var stuSch: String?
    //用户生日
    var stuBirth: String?
    //用户等级
    var level: String?
    //用户分豆币
    var fendoubi: String?
    //用户城市
    var city: String?
    //用户名ST516702
    var userName: String?
    //年级
    var grade: String?
    //学段
    var xueduan: String?
    
    override init() {
        super.init()
    }
    
    init(userId: String, stuName: String, stuSch: String, stuBirth: String, level: String, fendoubi: String, city: String, userName: String, grade: String, xueduan: String) {
        
        self.userId = userId
        self.stuName = stuName
        self.stuSch = stuSch
        self.stuBirth = stuBirth
        self.level = level
        self.fendoubi = fendoubi
        self.city = city
        self.userName = userName
        self.grade = grade
        self.xueduan = xueduan
    }
}

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
    //性别
    var sex: String?
    
    override init() {
        super.init()
    }
    
    init(userId: String, stuName: String, stuSch: String, stuBirth: String, level: String, fendoubi: String, city: String, userName: String, grade: String, xueduan: String, sex: String) {
        
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
        self.sex = sex
    }
    
    // 解档归档，用NSUserdefault本地存储model
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.stuName = aDecoder.decodeObjectForKey("student_name") as? String
        self.stuSch = aDecoder.decodeObjectForKey("student_school") as? String
        self.stuBirth = aDecoder.decodeObjectForKey("student_birthday") as? String
        self.level = aDecoder.decodeObjectForKey("level") as? String
        self.fendoubi = aDecoder.decodeObjectForKey("fendoubi") as? String
        self.city = aDecoder.decodeObjectForKey("city") as? String
        self.grade = aDecoder.decodeObjectForKey("grade") as? String
        self.sex = aDecoder.decodeObjectForKey("student_sex") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.stuName, forKey: "student_name")
        aCoder.encodeObject(self.stuSch, forKey: "student_school")
        aCoder.encodeObject(self.stuBirth, forKey: "student_birthday")
        aCoder.encodeObject(self.level, forKey: "level")
        aCoder.encodeObject(self.fendoubi, forKey: "fendoubi")
        aCoder.encodeObject(self.city, forKey: "city")
        aCoder.encodeObject(self.grade, forKey: "grade")
        aCoder.encodeObject(self.sex, forKey: "student_sex")
    }
}

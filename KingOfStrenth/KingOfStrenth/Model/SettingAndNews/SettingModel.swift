//
//  SettingModel.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class SettingModel: NSObject {
    var nick:String?
    var province_name:String?
    var schoolName:String?
    var student_birthday:String?
    var student_name:String?
    var student_sex:String?
    var xueduan:String?
    
    override init() {
        super.init()
    }
    
    init(nick:String,province_name:String,schoolName:String,student_birthday:String,student_name:String,student_sex:String,xueduan:String) {
        self.nick = nick
        self.province_name = province_name
        self.schoolName = schoolName
        self.student_birthday = student_birthday
        self.student_name = student_name
        self.student_sex = student_sex
        self.xueduan = xueduan
    }
    
    required init?(coder aDecoder:NSCoder){
        super.init()
        self.nick = aDecoder.decodeObjectForKey("nick") as? String
        self.province_name = aDecoder.decodeObjectForKey("province_name") as? String
        self.schoolName = aDecoder.decodeObjectForKey("schoolname") as? String
        self.student_birthday = aDecoder.decodeObjectForKey("student_birthday") as? String
        self.student_name = aDecoder.decodeObjectForKey("student_name") as? String
        self.student_sex = aDecoder.decodeObjectForKey("student_sex") as? String
        self.xueduan = aDecoder.decodeObjectForKey("xueduan") as? String

    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.nick, forKey: "nick")
        aCoder.encodeObject(self.province_name, forKey: "province_name")
        aCoder.encodeObject(self.schoolName, forKey: "schoolname")
        aCoder.encodeObject(self.student_birthday, forKey: "student_birthday")
        aCoder.encodeObject(self.student_name, forKey: "student_name")
        aCoder.encodeObject(self.student_sex, forKey: "student_sex")
        aCoder.encodeObject(self.xueduan, forKey: "xueduan")
    }

}

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

}

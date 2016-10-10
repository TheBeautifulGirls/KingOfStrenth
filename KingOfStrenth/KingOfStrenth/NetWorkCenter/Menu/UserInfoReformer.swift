//
//  UserInfoReformer.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

class UserInfoReformer: CSReformer {
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(UserInfoManager){
            var userInfoJSON = data
            let userInfoModel = MenuModel(userId: userInfoJSON["user_id"].stringValue, stuName: userInfoJSON["student_name"].stringValue, stuSch: userInfoJSON["student_school"].stringValue, stuBirth: userInfoJSON["student_birthday"].stringValue, level: userInfoJSON["level"].stringValue, fendoubi: userInfoJSON["fendoubi"].stringValue, city: userInfoJSON["city"].stringValue, userName: userInfoJSON["username"].stringValue, grade: userInfoJSON["grade"].stringValue)
            return userInfoModel
        }
        return MenuModel()
    }
}

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
            let userInfoModel = MenuModel(userId: userInfoJSON["user_id"].stringValue)
            return userInfoModel
        }
        return MenuModel()
    }
}

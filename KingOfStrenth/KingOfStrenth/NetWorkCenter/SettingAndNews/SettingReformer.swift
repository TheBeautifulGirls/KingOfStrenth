//
//  SettingReformer.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import SwiftyJSON

class SettingReformer: CSReformer {
    
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(SettingManager) {
            let model = SettingModel(nick: data["nick"].stringValue,
                                     province_name: data["province_name"].stringValue,
                                     schoolName: data["schoolname"].stringValue,
                                     student_birthday: data["student_birthday"].stringValue,
                                     student_name: data["student_name"].stringValue,
                                     student_sex: data["student_sex"].stringValue,
                                     xueduan: data["xueduan"].stringValue)
    

            return model
        }
        return SettingModel()
    }


}

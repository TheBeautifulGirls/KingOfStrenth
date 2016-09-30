//
//  RegistViewReformer.swift
//  KingOfStrenth
//
//  Created by ShuYan Feng on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

class RegistReformer: CSReformer {
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(RegistViewManager) {
            let registerModel = RegistModel(userID: data["userId"].stringValue)
            return registerModel
        }
        return RegistModel()
    }
}

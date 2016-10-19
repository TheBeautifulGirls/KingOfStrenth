//
//  GuoZiJianReformer.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

class GuoZiJianReformer: CSReformer {
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(GuoZiJianManager){
            let gzjInfoModel = GuoZiJianModel(dataSource: data)
            return gzjInfoModel
        }
        return GuoZiJianModel()
    }
}

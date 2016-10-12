//
//  DetailMessageReformer.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/10/8.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import SwiftyJSON

class DetailMessageReformer: CSReformer {
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(DetailMessageManager) {
            let DMDataArr = data["data"].array
            var modelArr: [MesDetailModel] = []
            
            for i in 0 ..< DMDataArr!.count {
                let model = MesDetailModel(title: DMDataArr![i]["title"].stringValue, created: DMDataArr![i]["created"].stringValue, contenturl: DMDataArr![i]["contenturl"].stringValue, comment: DMDataArr![i]["comment"].stringValue, id: DMDataArr![i]["id"].stringValue, status: DMDataArr![i]["status"].stringValue)
                
                modelArr.append(model)
            }
            
            let mesDetailModel = DetailMessageModel(mesArray: modelArr)
            
            return mesDetailModel
        }
        return DetailMessageModel()
    }
}

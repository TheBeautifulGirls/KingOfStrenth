//
//  CourseViewReformer.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

class CourseViewReformer: CSReformer {
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(CourseViewManager) {
            let userPhase = NSUserDefaults.standardUserDefaults()
            let phase = userPhase.objectForKey("userPhase") as! String
            let courseModel = CourseModel(dataSource: data["list"][phase])
            return courseModel
        }
        
        return CourseModel()
    }
}
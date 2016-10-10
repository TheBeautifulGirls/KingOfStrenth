//
//  CourseModel.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON

class CourseModel: NSObject {
 
    //用户ID
    var userID: String?
    //学段
    var phase: String?
    //数据源
    var dataSource: JSON?
    
    init(dataSource: JSON) {
        self.dataSource = dataSource
    }
    
    override init() {
        super.init()
    }
}
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
 
    //学段
    var phase: String?
    //数据源
    var dataSource: JSON?
    //科目
    var subject: String?
    //教材类型
    var subType: String!
    //教材ID
    var id: String!
    //教材名称
    var bookName: String?
    //教材版本
    var version: String?
    
    init(dataSource: JSON) {
        self.dataSource = dataSource
    }
    
    override init() {
        super.init()
    }
}
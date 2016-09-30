//
//  CourseViewManager.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import CSNetManager
import Alamofire

class CourseViewManager: CSAPIBaseManager,CSAPIManagerDelegate {
    // 版本号
    var apiVersion: String {
        get {return ""}
    }
    
    // 请求URL
    var apiName: String {
        get {return "/comm/getBooks_app.php"}
    }
    
    // 请求方式
    var httpMethod: Alamofire.Method {
        get {return .POST}
    }
    
    // 服务器配置
    var server: CSServer {
        get {return kServer}
    }
    
    override init () {
        super.init()
    }
    
}
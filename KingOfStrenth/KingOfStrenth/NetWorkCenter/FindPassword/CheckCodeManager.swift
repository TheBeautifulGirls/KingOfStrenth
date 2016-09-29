//
//  CheckCodeManager.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import Alamofire

class CheckCodeManager: CSAPIBaseManager,CSAPIManagerDelegate {
    // 版本号
    var apiVersion: String {
        get {return ""}
    }
    
    // 请求URL
    var apiName: String {
        get {return "/validCode?"}
    }
    
    // 请求方式
    var httpMethod: Alamofire.Method {
        get {return .GET}
    }
    
    // 服务器配置
    var server: CSServer {
        get {return codeServer}
    }
    
    override init () {
        super.init()
    }

}

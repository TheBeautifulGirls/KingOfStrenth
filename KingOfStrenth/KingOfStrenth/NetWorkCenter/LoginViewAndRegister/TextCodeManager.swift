//
//  TextCodeManager.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/28.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import Alamofire

class TestCodeManager: CSAPIBaseManager, CSAPIManagerDelegate {
    // url拼接
    var phoneNum: String?
    var code: String?
    let s = NSString(format: "4fH1w90sPpIX4z")
    
    // 版本号
    var apiVersion: String {
        get {return ""}
    }
    // 请求URL
    var apiName: String {
        get {return  "/validCode?"}
    }
    // 请求方式
    var httpMethod: Alamofire.Method {
        get {return .GET}
    }
    // 服务器配置
    var server: CSServer {
        get {return kServer}
    }
    
    override init() {
        super.init()
        self.timeoutInterval = 2
    }
}


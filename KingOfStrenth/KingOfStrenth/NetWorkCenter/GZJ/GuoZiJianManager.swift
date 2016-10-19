//
//  GuoZiJianManager.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import Alamofire

class GuoZiJianManager: CSAPIBaseManager, CSAPIManagerDelegate {
    // 版本号
    var apiVersion: String {
        get {return ""}
    }
    
    // 请求URL
    var apiName: String {
        get {return "/mingshi/getVideoCN.php"}
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

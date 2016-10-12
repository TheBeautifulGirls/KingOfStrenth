//
//  DetailMessageManager.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import Alamofire

class DetailMessageManager: CSAPIBaseManager, CSAPIManagerDelegate {
    
    // 版本号
    var apiVersion: String {
        get {return ""}
    }
    
    // 请求URL
    var apiName: String {
        get {return "/messages/getMessageData.php"}
    }
    
    // 服务器配置
    var server: CSServer {
        get {return kServer}
    }
    
    // 请求方式
    var httpMethod: Alamofire.Method {
        get {return .POST}
    }
    
}

//
//  SettingManager.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import Alamofire

class SettingManager:  CSAPIBaseManager, CSAPIManagerDelegate  {
    
    var apiVersion: String {
        get {return ""}
    }
    
    // 请求URL
    var apiName: String {
        get {return "/xitongshezhi/getStudentInfoById.php"}
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

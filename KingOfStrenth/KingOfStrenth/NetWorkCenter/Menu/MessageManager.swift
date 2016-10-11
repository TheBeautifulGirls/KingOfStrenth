//
//  MessageManager.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import Alamofire

class MessageManager: CSAPIBaseManager, CSAPIManagerDelegate {
    
    var apiVersion: String {
        get {return ""}
    }
    
    var apiName: String {
        get {return "/messages/getMessageData.php"}
    }
    
    var httpMethod: Alamofire.Method {
        get {return .POST}
    }
    
    var server: CSServer {
        get {return kServer}
    }
}

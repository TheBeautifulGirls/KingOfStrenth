//
//  LoginAndRegisterDataCenter.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

let INFO = LoginAndRegisterDataCenter.shareData as LoginAndRegisterDataCenter

import Foundation

class LoginAndRegisterDataCenter: NSObject {

    var userInfo : NSMutableDictionary?
    
    override init() {
        super.init()
        
        userInfo = NSMutableDictionary()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userInfo = userDefaults.objectForKey("This is userInfo") as? NSMutableDictionary
    }
    
    class var shareData: LoginAndRegisterDataCenter {
        struct Static {
            static let instance: LoginAndRegisterDataCenter = LoginAndRegisterDataCenter()
        }
        return Static.instance
    }
    
    func userName() -> String {
        if userInfo != nil {
            return userInfo!["userName"] as! String
        }
        return ""
    }
    
    func password() -> String {
        if userInfo != nil {
            return userInfo!["password"] as! String
        }
        return ""
    }
    
    
}
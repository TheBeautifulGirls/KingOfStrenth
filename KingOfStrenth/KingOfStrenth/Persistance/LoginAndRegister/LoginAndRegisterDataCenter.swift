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
    var userModel: LoginModel?
    
    
    override init() {
        super.init()
        
        userInfo = NSMutableDictionary()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userInfo = userDefaults.objectForKey("This is userInfo") as? NSMutableDictionary
        
        getuserInfoModel()
    }
    
    class var shareData: LoginAndRegisterDataCenter {
        struct Static {
            static let instance: LoginAndRegisterDataCenter = LoginAndRegisterDataCenter()
        }
        return Static.instance
    }
    
    // MARK: - private method
    
    func getuserInfoModel() -> LoginModel {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.objectForKey("userInfo") != nil {
            let infoData = userDefaults.objectForKey("userInfo") as! NSData
            userModel = NSKeyedUnarchiver.unarchiveObjectWithData(infoData) as? LoginModel
            
            return userModel!
        }
        return LoginModel()
    }
    
    func userName() -> String? {
        if userInfo != nil {
            return userInfo!["userName"] as? String
        }
        return ""
    }
    
    func password() -> String? {
        if userInfo != nil {
            return userInfo!["password"] as? String
        }
        return ""
    }
    
    func userId() -> String? {
        if userModel != nil {
            return userModel?.userId
        }
        return ""
    }
    
    
}
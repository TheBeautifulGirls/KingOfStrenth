//
//  MenuDataCenter.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

let MENUINFO = MenuDataCenter.Data as MenuDataCenter

import Foundation

class MenuDataCenter: NSObject {
    
    var menuUserModel : MenuModel?
    
    override init() {
        super.init()
        
//        menuUserInfo = NSMutableDictionary()
//        
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        menuUserInfo = userDefaults.objectForKey("This is menuInfo") as? NSMutableDictionary
        
//        getmenuUserInfoModel()
    }
    
    class var Data: MenuDataCenter {
        struct Static {
            static let instance:MenuDataCenter = MenuDataCenter()
        }
        return Static.instance
    }
    
//    //MARK: - private method
//    
//    func getmenuUserInfoModel() -> MenuModel {
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        
//        if userDefaults.objectForKey("menuInfo") != nil {
//            let data = userDefaults.objectForKey("menuInfo") as! NSData
//            menuUserModel = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? MenuModel
//            return menuUserModel!
//        }
//        return MenuModel()
//    }
    
    func stuName() -> String? {
        if menuUserModel != nil {
            return menuUserModel?.stuName
        }
        return ""
    }
    
    func city() -> String? {
        if menuUserModel != nil {
            return menuUserModel?.city
        }
        return ""
    }
    
    func stuSch() ->String? {
        if menuUserModel != nil {
            return menuUserModel?.stuSch
        }
        return ""
    }
    
    func stuBirth() ->String? {
        if menuUserModel != nil {
            return menuUserModel?.stuBirth
        }
        return ""
    }
    
    func level() ->String? {
        if menuUserModel != nil {
            return menuUserModel?.level
        }
        return ""
    }
    
    func fendoubi() -> String? {
        if menuUserModel != nil {
            return menuUserModel?.fendoubi
        }
        return ""
    }
    
    func grade() -> String? {
        if menuUserModel != nil {
            return menuUserModel?.grade
        }
        return ""
    }
    
}

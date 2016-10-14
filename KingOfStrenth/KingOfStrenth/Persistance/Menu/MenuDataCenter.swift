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
    var menuUserInfo : NSMutableDictionary?
    var settingInfo:NSMutableDictionary?
    
    var settingModel:SettingModel?
    
    override init() {
        super.init()
        
        menuUserInfo = NSMutableDictionary()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        menuUserInfo = userDefaults.objectForKey("This is menuInfo") as? NSMutableDictionary
        
//        let userDefaultsSetting = NSUserDefaults.standardUserDefaults()
//        settingInfo = userDefaultsSetting.objectForKey("settingInfo") as? NSMutableDictionary
//        print("~~~~~~~~~~~~~~~~~~\(settingInfo)~~~~~~~~~~~~~~~~~")
        
        getsettingUserInfoModel()
        getmenuUserInfoModel()
    }
    
    class var Data: MenuDataCenter {
        struct Static {
            static let instance:MenuDataCenter = MenuDataCenter()
        }
        return Static.instance
    }
    
//    //MARK: - private method
//    
    func getmenuUserInfoModel() -> MenuModel {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.objectForKey("menuInfo") != nil {
            let data = userDefaults.objectForKey("menuInfo") as! NSData
            menuUserModel = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? MenuModel
            return menuUserModel!
        }
        return MenuModel()
    }
    
    func getsettingUserInfoModel() -> SettingModel {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.objectForKey("settingInfo") != nil {
            let data = userDefaults.objectForKey("settingInfo") as! NSData
            settingModel = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? SettingModel
            print("%%%%%%%%%\(settingModel?.province_name)%%%%%%%%")
            return settingModel!
        }
        return SettingModel()
    }
    
    
    
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
    
    func xueduan() -> String? {
        if menuUserModel != nil {
            return menuUserModel?.xueduan
        }
        return ""
    }
    
    func sex() -> String {
        if menuUserModel != nil {
            return (menuUserModel?.sex)!
        }
        return ""
    }
    
    //设置信息
    func nick() -> String{
        if settingModel != nil{
            return (settingModel?.nick)!
        }
        
        return ""
    }
    
    func province_name() -> String{
        if settingModel != nil{
            return (settingModel?.province_name)!
        }
        
        return ""
    }
    
    func schoolname() -> String{
        if settingModel != nil{
            return (settingModel?.schoolName)!
        }
        
        return ""
    }
    
    func student_birthday() -> String{
        if settingModel != nil{
            return (settingModel?.student_birthday)!
        }
        
        return ""
    }
    
    func student_name() -> String{
        if settingModel != nil{
            return (settingModel?.student_name)!
        }
        
        return ""
    }
    
    func student_sex() -> String{
        if settingModel != nil{
            return (settingModel?.student_sex)!
        }
        
        return ""
    }
    
    func xueduan1() -> String{
        if settingModel != nil{
            return (settingModel?.xueduan)!
        }
        
        return ""
    }
}

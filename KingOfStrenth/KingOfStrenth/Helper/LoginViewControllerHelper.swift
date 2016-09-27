//
//  LoginViewControllerHelper.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/23.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

class LoginViewControllerHelper: NSObject, CSAPIManagerApiCallBackDelegate, CSAPIManagerParamSourceDelegate {
    
    var loginManager: LoginViewManager?
    var loginRequest: LoginModel?
    
    var loginViewController: LoginViewController?
    
    // MARK: - life cycle
    override init() {
        super.init()
        
        initManager()
    }
    
    func initManager() {
        loginManager = LoginViewManager()
        loginManager?.callBackDelegate = self
        loginManager?.paramSource = self
        
    }
    
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(LoginViewManager) {
            loginManager?.hideHUD()
            print(data)
            if data["success"].intValue == 1 {
                print("请求成功")
            } else {
                YAlertViewController.showAlertController(loginViewController!, title: "提示", message: data["message"].stringValue)
            }
        }
    }
    
    // 请求失败
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) {
        if apimanager.isKindOfClass(LoginViewManager) {
            loginManager?.hideHUD()
        }
        switch error {
        case .Timeout:
            YAlertViewController.showAlertController(loginViewController!, title: "提示", message: "网络超时，请稍后重试")
            break
        case .NoNetWork:
            YAlertViewController.showAlertController(loginViewController!, title: "提示", message: "您的网络不太给力，请稍后再试！")
            break
        case .RequestFailed:
            YAlertViewController.showAlertController(loginViewController!, title: "提示", message: "请求失败，请稍后重试")
            break
        default: break
        }
    }
    
    // 请求报文
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        
//        var array = 
        if manager.isKindOfClass(LoginViewManager) {
            dic["username"] = loginRequest?.userName
            dic["password"] = loginRequest?.password
            // 安卓版本用：1pad端,2手机端， ios版本用：1ipad 企业版 2ipad app版 3 iphone企业版 4 iphone app版
            // 获取用户类型
            dic["release"] = UIDevice.currentDevice().systemVersion
            dic["model"] = UIDevice.currentDevice().identifierForVendor!.UUIDString
            dic["terminal"] = "i"
            dic["userId"] = ""
            dic["usertype"] = 3
            print(dic)
            
            let data = try! NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions.PrettyPrinted)
            let strJson = NSString(data: data, encoding: NSUTF8StringEncoding)
//            dic["data"] = strJson
        } 
        return dic
    }
}
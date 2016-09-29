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

protocol LoginViewCallBackDelegate: NSObjectProtocol {
    func callBackSuccess(manager: CSAPIBaseManager)
    func callBackFailure()
}

class LoginViewControllerHelper: NSObject, CSAPIManagerApiCallBackDelegate, CSAPIManagerParamSourceDelegate {
    
    var callBackDelegate: LoginViewCallBackDelegate?
    
    var loginManager: LoginViewManager?
    var loginRequest: LoginModel!
    var loginModel: LoginModel!
    
    var loginReformer: LoginViewReformer?
    
    var loginViewController: LoginViewController?
    
    // MARK: - life cycle
    override init() {
        super.init()
        
        initManager()
    }
    
    // MARK: - private method
    func initManager() {
        loginManager = LoginViewManager()
        loginManager?.callBackDelegate = self
        loginManager?.paramSource = self
        
        loginReformer = LoginViewReformer()
    }
    
    // 登录后请求到的数据本地化存储
    func localStorageDataWithModel(model: LoginModel) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        let infoData = NSKeyedArchiver.archivedDataWithRootObject(model)
        userDefault.setObject(infoData, forKey: "userInfo")
        userDefault.synchronize()
    }
    
    // MARK: - CSAPIManagerApiCallBackDelegate
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(LoginViewManager) {
            loginManager?.hideHUD()
            print(data)
            if data["success"].intValue == 1 {
                print("请求成功")
                loginModel = apiManager.fetchData(loginReformer!) as! LoginModel
    
                localStorageDataWithModel(loginModel)
                
                self.callBackDelegate?.callBackSuccess(apiManager)
            } else {
                YAlertViewController.showAlertController(loginViewController!, title: "提示", message: data["message"].stringValue)
                self.callBackDelegate?.callBackFailure()
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
    
    // MARK: - CSAPIManagerParamSourceDelegate
    // 请求报文
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        
//        var array = 
        if manager.isKindOfClass(LoginViewManager) {
            dic["username"] = loginRequest?.userName
            dic["password"] = loginRequest?.password
            // 安卓版本用：1pad端,2手机端， ios版本用：1ipad 企业版 2ipad app版 3 iphone企业版 4 iphone app版
            // 获取用户类型
//            dic["release"] = UIDevice.currentDevice().systemVersion
//            dic["model"] = UIDevice.currentDevice().identifierForVendor!.UUIDString
//            dic["terminal"] = "i"
//            dic["userId"] = ""
//            dic["usertype"] = 3
        }
        return dic
    }
}
//
//  RegistViewControllerHelper.swift
//  KingOfStrenth
//
//  Created by ShuYan Feng on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SwiftyJSON
import CSNetManager

protocol RegistViewCallBackDelegate: NSObjectProtocol {
    func callBackSuccess(manager: CSAPIBaseManager)
    func callBackFailure()
}

class RegistViewControllerHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    var registViewManager: RegistViewManager?
    var registReformer: RegistReformer?
    var registModel: RegistModel?
    
    weak var callBackDelegate: RegistViewCallBackDelegate?
    
    var registerViewController: RegisterViewController?
    
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(RegistViewManager) {
            registModel = apiManager.fetchData(registReformer!) as? RegistModel
            callBackDelegate?.callBackSuccess(apiManager)
        }
    }
    
    // 请求失败
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType){
        callBackDelegate?.callBackFailure()
        switch error {
        case .Timeout:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "网络超时，请稍后重试")
            break
        case .NoNetWork:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "您的网络不太给力，请稍后再试！")
            break
        case .RequestFailed:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "请求失败，请稍后重试")
            break
        default: break
        }
    }
    
    // 请求报文
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        if manager.isKindOfClass(RegistViewManager) {
            dic["xueduan"] = registModel?.phase
            dic["username"] = registModel?.userName
            dic["password"] = registModel?.password
            dic["studentPhone"] = registModel?.phoneNumber
        }        
        return dic
    }
    
    //MARK: -- private method
    //初始化manager
    func initManager() {
        registViewManager = RegistViewManager()
        registReformer = RegistReformer()
        registModel = RegistModel()
        
        registerViewController = RegisterViewController()
    }
}

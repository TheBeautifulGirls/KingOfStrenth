//
//  MenuViewControllerHelper.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

protocol MenuViewCallBackDelegate: NSObjectProtocol {
    func callBackSuccess(manger:CSAPIBaseManager)
    func callBackFailure()
}

class MenuViewControllerHelper: NSObject, CSAPIManagerApiCallBackDelegate, CSAPIManagerParamSourceDelegate {
    
    var callBackDelegate:MenuViewCallBackDelegate?
    
    var menuManager: UserInfoManager?
    var menuRequest: MenuModel!
    var menuModel: MenuModel!
    
    var menuReformer: UserInfoReformer?
    
    var menuViewController: MenuViewController?
    
    //MARK: - life cycle
    override init() {
        super.init()
        
        initManager()
    }
    
    func initManager() {
        menuManager = UserInfoManager()
        menuModel = MenuModel()
        menuManager?.callBackDelegate = self
        menuManager?.paramSource = self
        
        menuReformer = UserInfoReformer()
    }
    
    // 进入首页后请求到的数据本地化存储
//    func localStorageDataWithModel(model: MenuModel) {
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        
//        let infoData = NSKeyedArchiver.archivedDataWithRootObject(model)
//        userDefault.setObject(infoData, forKey: "menuInfo")
//        userDefault.synchronize()
//    }
    
    // MARK: - CSAPIManagerApiCallBackDelegate
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(UserInfoManager) {
             menuModel = apiManager.fetchData(menuReformer!) as? MenuModel
            callBackDelegate?.callBackSuccess(apiManager)
//            menuManager?.hideHUD()
            print("个人信息",data)
            if data["state"].intValue == 1 {
                print("请求成功")
                
            }
        }
    }
    
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) {
        callBackDelegate?.callBackFailure()
        switch error {
        case .Timeout:
            YAlertViewController.showAlertController(menuViewController!, title: "提示", message: "网络超时，请稍后重试")
            break
        case .NoNetWork:
            YAlertViewController.showAlertController(menuViewController!, title: "提示", message: "您的网络不太给力，请稍后再试！")
            break
        case .RequestFailed:
            YAlertViewController.showAlertController(menuViewController!, title: "提示", message: "请求失败，请稍后重试")
            break
        default: break
        }

    }
    
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        if manager.isKindOfClass(UserInfoManager) {
            
            let userInfo = LoginAndRegisterDataCenter()
            dic["userID"] = userInfo.userId()
            
        }
        return dic
    }
}
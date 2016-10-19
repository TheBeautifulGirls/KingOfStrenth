//
//  GuoZiJianViewControllerHelper.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

protocol GuoZiJianViewCallBackDelegate: NSObjectProtocol {
    func callBackSuccess(manager:CSAPIBaseManager)
    func callBackFailure()
}

class GuoZiJianViewControllerHelper: NSObject, CSAPIManagerApiCallBackDelegate, CSAPIManagerParamSourceDelegate {
    
    var callBackDelegate:GuoZiJianViewCallBackDelegate?
    
    var guoZiJianManager:GuoZiJianManager?
    var guoZiJianRequest:GuoZiJianModel!
    var guoZiJianModel:GuoZiJianModel!
    
    var guoZiJianRefoemer:GuoZiJianReformer?
    
    var guoZiJianViewController: GuoZiJianViewController?
    
    //MARK: - life cycle
    override init() {
        super.init()
        initManager()
    }
    
    func initManager() {
        guoZiJianManager = GuoZiJianManager()
        guoZiJianModel = GuoZiJianModel()
        guoZiJianManager?.callBackDelegate = self
        guoZiJianManager?.paramSource = self
        
        guoZiJianRefoemer = GuoZiJianReformer()
    }
    
    //MARK: - CSAPIManagerApiCallBackDelegate
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        print("guozijian", data)
        if apiManager.isKindOfClass(GuoZiJianManager) {
            guoZiJianModel = apiManager.fetchData(guoZiJianRefoemer!) as? GuoZiJianModel
//            localStorageDataWithModel(guoZiJianModel)
            
            callBackDelegate?.callBackSuccess(apiManager)
        }
    }
    
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) {
        callBackDelegate!.callBackFailure()
        switch error {
        case .Timeout:
            YAlertViewController.showAlertController(guoZiJianViewController!, title: "提示", message: "网络超时，请稍后重试")
            break
        case .NoNetWork:
            YAlertViewController.showAlertController(guoZiJianViewController!, title: "提示", message: "您的网络不太给力，请稍后再试！")
            break
        case .RequestFailed:
            YAlertViewController.showAlertController(guoZiJianViewController!, title: "提示", message: "请求失败，请稍后重试")
            break
        default: break
        }
    }
    
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        if manager.isKindOfClass(GuoZiJianManager) {
            let xueduan = NSUserDefaults.standardUserDefaults()
            dic["xueduan"] = xueduan.objectForKey("userPhase")
        }
        return dic
    }
}
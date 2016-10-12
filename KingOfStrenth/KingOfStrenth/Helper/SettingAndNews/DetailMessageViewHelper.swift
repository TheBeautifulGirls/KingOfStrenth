//
//  DetailMessageViewHelper.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import SwiftyJSON

protocol DetailMessageViewCallBackDelegate {
    func callBackSuccess(manager: CSAPIBaseManager)
    func callBackFailure()
}

class DetailMessageViewHelper: NSObject, CSAPIManagerApiCallBackDelegate, CSAPIManagerParamSourceDelegate {
    
    var pageNow = 1
    var messageId: String?
    
    // 获取消息列表
    var detailMessageManager: DetailMessageManager?
    var detailMessageReformer: DetailMessageReformer?
    var detailMessageModel: DetailMessageModel!
    
    // 改变消息状态
    var changeStatusManager: ChangeStatusManager?
    
    // 删除消息
    var clearMessageManager: ClearMessageManager?
    
    var callBackDelegate: DetailMessageViewCallBackDelegate!
    var messageViewController: MessageViewController!
    
    // MARK: - life cycle
    override init() {
        super.init()
        
        initManager()
    }
    // MARK: - private method
    func initManager() {
        detailMessageManager = DetailMessageManager()
        detailMessageManager?.callBackDelegate = self
        detailMessageManager?.paramSource = self
        
        changeStatusManager = ChangeStatusManager()
        changeStatusManager?.callBackDelegate = self
        changeStatusManager?.paramSource = self
        
        clearMessageManager = ClearMessageManager()
        clearMessageManager?.callBackDelegate = self
        clearMessageManager?.paramSource = self
        
        detailMessageReformer = DetailMessageReformer()
        
        detailMessageModel = DetailMessageModel()
    }
    
    // MARK: - CSAPIManagerApiCallBackDelegate
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(DetailMessageManager) {
            detailMessageManager?.hideHUD()
            print(data)
            if data["success"].intValue == 1 {
                detailMessageModel = apiManager.fetchData(detailMessageReformer!) as! DetailMessageModel
                self.callBackDelegate.callBackSuccess(apiManager)
            } else {
                self.callBackDelegate.callBackFailure()
            }
        }
        if apiManager.isKindOfClass(ChangeStatusManager) {
            changeStatusManager?.hideHUD()
            if data["result"].intValue == 1 {
                self.callBackDelegate.callBackSuccess(apiManager)
            } else {
//                self.callBackDelegate.callBackFailure()
            }
        }
        
        if apiManager.isKindOfClass(ClearMessageManager) {
            clearMessageManager?.hideHUD()
            if data["success"].intValue == 1 {
                self.callBackDelegate.callBackSuccess(apiManager)
            } else {
//                self.callBackDelegate.callBackFailure()
            }
        }
    }
    
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) {
        if apimanager.isKindOfClass(DetailMessageManager) {
            detailMessageManager?.hideHUD()
        }
        if apimanager.isKindOfClass(ChangeStatusManager) {
            changeStatusManager?.hideHUD()
        }
        if apimanager.isKindOfClass(ClearMessageManager) {
            clearMessageManager?.hideHUD()
        }
        switch error {
        case .Timeout:
            YAlertViewController.showAlertController(messageViewController, title: "提示", message: "网络超时，请稍后重试")
            break
        case .NoNetWork:
            YAlertViewController.showAlertController(messageViewController, title: "提示", message: "您的网络不太给力，请稍后再试！")
            break
        case .RequestFailed:
            YAlertViewController.showAlertController(messageViewController, title: "提示", message: "请求失败，请稍后重试")
            break
        default: break
        }
    }
    
    // MARK: - CSAPIManagerParamSourceDelegate
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        
        if manager.isKindOfClass(DetailMessageManager) {
            dic["userID"] = INFO.userId()
            dic["page"] = pageNow
            dic["count"] = 15
            dic["user_type"] = 1
            dic["type"] = ""
            dic["read"] = ""
        }
        
        if manager.isKindOfClass(ChangeStatusManager) {
            dic["userID"] = INFO.userId()
            dic["id"] = messageId
            let s = NSString(format: "4fH1w90sPpIX4z%@",INFO.userId() ?? "")
            dic["mk"] = s.stringMD5()
            
        }
        
        if manager.isKindOfClass(ClearMessageManager) {
            dic["userID"] = INFO.userId()
            dic["userType"] = "1"
            let s = NSString(format: "4fH1w90sPpIX4z%@",INFO.userId() ?? "")
            dic["mk"] = s.stringMD5()
        }
        return dic
    }
}

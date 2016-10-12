//
//  CourseViewControllerHelper.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SwiftyJSON
import CSNetManager
protocol CourseViewCallBackDelegate: NSObjectProtocol {
    func callBackSuccess(manager: CSAPIBaseManager)
    func callBackFailure()
}

class CourseViewControllerHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    //获取教材
    var courseManager: CourseViewManager?
    var courseReformer: CourseViewReformer?
    var courseModel: CourseModel?
    //保存版本信息
    var saveVersionManager: SaveVersionManager?
    //代理
    weak var callBackDelegate: CourseViewCallBackDelegate?
    
    //控制器
    var courseViewController: CourseViewController?
    
    override init() {
        super.init()
        initManager()
    }
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {

        if apiManager.isKindOfClass(CourseViewManager) {
            courseModel = apiManager.fetchData(courseReformer!) as? CourseModel
            callBackDelegate?.callBackSuccess(apiManager)
        }
        if apiManager.isKindOfClass(SaveVersionManager) {
            callBackDelegate?.callBackSuccess(apiManager)
        }
    }
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) {
        callBackDelegate?.callBackFailure()
        switch error {
        case .Timeout:
            YAlertViewController.showAlertController(courseViewController!, title: "提示", message: "网络超时，请稍后重试")
            break
        case .NoNetWork:
            YAlertViewController.showAlertController(courseViewController!, title: "提示", message: "您的网络不太给力，请稍后再试！")
            break
        case .RequestFailed:
            YAlertViewController.showAlertController(courseViewController!, title: "提示", message: "请求失败，请稍后重试")
            break
        default: break
        }

    }
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        if manager.isKindOfClass(CourseViewManager) {
            dic["userID"] = "536002"
        }
        if manager.isKindOfClass(SaveVersionManager) {
            dic["userID"] = "536002"
//            let s = NSString(format: "4fH1w90sPpIX4z%@",INFO.userId() ?? "")
//            dic["mk"] = s.stringMD5()
            dic["banben"] = courseModel?.version
        }
        return dic
    }
    
    //MARK: - private method
    func initManager() {
        //获取教材
        courseManager = CourseViewManager()
        courseReformer = CourseViewReformer()
        courseManager?.callBackDelegate = self
        courseManager?.paramSource = self
    
        courseModel = CourseModel()
        
        //保存版本信息
        saveVersionManager = SaveVersionManager()
        saveVersionManager?.callBackDelegate = self
        saveVersionManager?.paramSource = self
    }
}
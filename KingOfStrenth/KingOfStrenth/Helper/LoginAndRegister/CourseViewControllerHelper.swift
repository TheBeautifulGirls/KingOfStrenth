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
    func callBackSuccess()
    func callBackFailure()
}

class CourseViewControllerHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    var courseManager: CourseViewManager?
    var courseReformer: CourseViewReformer?
    var courseModel: CourseModel?
    //代理
    weak var callBackDelegate: CourseViewCallBackDelegate?
    
    //控制器
    var courseViewController: CourseViewController?
    
    override init() {
        super.init()
        initManager()
    }
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
//        print(data)//全部教材
        if apiManager.isKindOfClass(CourseViewManager) {
            courseModel = apiManager.fetchData(courseReformer!) as? CourseModel
            callBackDelegate?.callBackSuccess()
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
        dic["userID"] = "536002"
        return dic
    }
    
    //MARK: - private method
    func initManager() {
        courseManager = CourseViewManager()
        courseReformer = CourseViewReformer()
        courseManager?.callBackDelegate = self
        courseManager?.paramSource = self
    
        courseModel = CourseModel()
    }
}
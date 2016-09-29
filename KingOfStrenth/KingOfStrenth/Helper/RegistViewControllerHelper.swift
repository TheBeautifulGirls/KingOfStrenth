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
    func callBackFailure(manager: CSAPIBaseManager)
}

class RegistViewControllerHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    var registViewManager: RegistViewManager?
    var registReformer: RegistReformer?
    var registModel: RegistModel?
    // 获取验证码
    var getCodeManager: GetCodeManager?
    var getCodeModel: RegistModel?
    //校验验证码
    var testCodeManager: TestCodeManager?
    var testCodeModel: RegistModel?
    
    weak var callBackDelegate: RegistViewCallBackDelegate?
    
    var registerViewController: RegisterViewController?
    
    override init() {
        super.init()
        initManager()
    }
    
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(RegistViewManager) {
            registModel = apiManager.fetchData(registReformer!) as? RegistModel
            callBackDelegate?.callBackSuccess(apiManager)
        }
        if apiManager.isKindOfClass(GetCodeManager) {
            if data["success"].boolValue == true {
                callBackDelegate?.callBackSuccess(apiManager)
            } else {
                getCodeFailure(data["status"].intValue, msg: data["msg"].intValue)
                callBackDelegate?.callBackFailure(apiManager)
            }
        }
        if apiManager.isKindOfClass(TestCodeManager) {
            if data["success"].boolValue == true {
                callBackDelegate?.callBackSuccess(apiManager)
            } else {
                testCodeFailure(data["status"].intValue, msg: data["msg"].intValue)
                callBackDelegate?.callBackFailure(apiManager)
            }
        }
    }
    
    // 请求失败
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType){
        callBackDelegate?.callBackFailure(apimanager)
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
        if manager.isKindOfClass(GetCodeManager) {
            let str = NSString(format: "4fH1w90sPpIX4z")
            dic["type"] = "ios"
            dic["phone"] = getCodeModel?.phoneNumber
            dic["sign"] = str.stringMD5()
        }
        if manager.isKindOfClass(TestCodeManager) {
            let str = NSString(format: "4fH1w90sPpIX4z")
            dic["code"] = testCodeModel?.code
            dic["phone"] = testCodeModel?.phoneNumber
            dic["sign"] = str.stringMD5()
        }
        return dic
    }
    
    //MARK: -- private method
    //初始化manager
    func initManager() {
        //注册
        registViewManager = RegistViewManager()
        registReformer = RegistReformer()
        registModel = RegistModel()
        registViewManager?.callBackDelegate = self
        registViewManager?.paramSource = self
        
        //获取验证码
        getCodeManager = GetCodeManager()
        getCodeModel = RegistModel()
        getCodeManager?.callBackDelegate = self
        getCodeManager?.paramSource = self
        
        //校验验证码
        testCodeManager = TestCodeManager()
        testCodeModel = RegistModel()
        testCodeManager?.callBackDelegate = self
        testCodeManager?.paramSource = self
        
        registerViewController = RegisterViewController()
    }
    // 获取验证码失败
    func getCodeFailure(type: Int, msg: Int) {
        switch type {
        case 101:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "校验字段为空")
            
            break
        case 201:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "校验字段不合法")
            break
        case 302:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "短信发送失败")
            break
        case 411:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: String.init(format: "童鞋一个小时只有获取6次验证码的机会哦！请过%d分钟再进行获取验证码！", msg))
            break
        case 4072:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "短信内容与模板不匹配")
            break
        default:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "请求失败")
            break
        }
    }
    // 校验验证码失败处理
    func testCodeFailure(type: Int, msg: Int) {
        switch type {
        case 101, 201, 302, 407, 4051, 4073, 405, 601, 4072:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "验证码验证失败")
            break
        case 502:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "手机号或验证码不正确")
            break
        case 701:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "验证码超时")
            break
        case 501, 301:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "短信发送成功")
            break
        case 411:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: String.init(format: "童鞋一个小时只有获取6次验证码的机会哦！请过%d分钟再进行获取验证码！", msg))
            break
        case 801:
            YAlertViewController.showAlertController(registerViewController!, title: "提示", message: "验证码10分钟之内只能使用一次")
            break
            
        default: break
            
        }
    }
}

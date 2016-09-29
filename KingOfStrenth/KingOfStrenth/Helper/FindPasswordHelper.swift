//
//  FindPasswordHelper.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SwiftyJSON
import CSNetManager

protocol findPasswordCallBackDelegate:NSObjectProtocol {
    func callBackSuccess(manager:CSAPIBaseManager)
    func callBackFailure()
}

class FindPasswordHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    var codeManager:GetCodeManager?
    var codeReformer:GetCodeReformer?
    
    var checkCodeManager:CheckCodeManager?
    var checkCodeReformer:CheckCodeReformer?
    
    var checkIsBoundManager:CheckIsBoundManager?
    var checkIsBoundReformer:CheckIsBoundReformer?
    
    var findPasswordManager:FindPasswordManager?
    var findPasswordReformer:FindPasswordReformer?
    
    
    var callBackDelegate:findPasswordCallBackDelegate?
    
    var phoneNumberString:String?
    var codeString:String?
    var passwordString:String?
    var type:String = "1"
    
    var dic = [String: JSON]()
    
    override init() {
        super.init()
        
        initManager()
    }
    
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        
        if apiManager.isKindOfClass(CheckIsBoundManager){
            dic = data.dictionaryValue
           
        }else if apiManager.isKindOfClass(GetCodeManager){
            dic = data.dictionaryValue
        }else if apiManager.isKindOfClass(CheckCodeManager){
            dic = data.dictionaryValue
        }else if apiManager.isKindOfClass(FindPasswordManager){
            dic = data.dictionaryValue
        }
        
         callBackDelegate?.callBackSuccess(apiManager)
        
    }
    
    // 请求失败
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType){
        switch error {
        case .Timeout:
            print("超时\(error)")
            
            break
        case .NoNetWork:
            print("网络异常\(error)")
            
            break
        case .RequestFailed:
            print("请求失败\(error)")
            
            break
        default: break
        }
    }
    
    // 请求报文
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        if manager.isKindOfClass(CheckIsBoundManager){
            //电话号码
            dic["student_phone"] = phoneNumberString
            print(dic)
        }else if manager.isKindOfClass(GetCodeManager){
            let str = NSString(format: "4fH1w90sPpIX4z")
            dic["type"] = "ios"
            dic["phone"] = self.phoneNumberString
            dic["sign"] = str.stringMD5()
        }else if manager.isKindOfClass(CheckCodeManager){
            let str = NSString(format: "4fH1w90sPpIX4z")
            dic["phone"] = self.phoneNumberString
            dic["code"] = self.codeString
            dic["sign"] = str.stringMD5()
        }else if manager.isKindOfClass(FindPasswordManager){
            dic["account"] = self.phoneNumberString
            dic["stepType"] = self.type
            dic["passWord"] = self.passwordString
        }
        return dic
    }
    
    func initManager(){
        //判定手机号是否绑定
        checkIsBoundManager = CheckIsBoundManager()
        checkIsBoundReformer = CheckIsBoundReformer()
        checkIsBoundManager?.callBackDelegate = self
        checkIsBoundManager?.paramSource = self
        //获取验证码
        codeManager = GetCodeManager()
        codeReformer = GetCodeReformer()
        codeManager?.callBackDelegate = self
        codeManager?.paramSource = self
        //校验验证码
        checkCodeManager = CheckCodeManager()
        checkCodeReformer = CheckCodeReformer()
        checkCodeManager?.callBackDelegate = self
        checkCodeManager?.paramSource = self
        //找回密码
        findPasswordManager = FindPasswordManager()
        findPasswordReformer = FindPasswordReformer()
        findPasswordManager?.callBackDelegate = self
        findPasswordManager?.paramSource = self
        
    }
    
}

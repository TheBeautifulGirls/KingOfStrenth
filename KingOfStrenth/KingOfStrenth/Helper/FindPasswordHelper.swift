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
    
    var checkIsBoundManager:CheckIsBoundManager?
    var checkIsBoundReformer:CheckIsBoundReformer?
    //var codeModel:CodeModel?
    
    var callBackDelegate:findPasswordCallBackDelegate?
    
    var phoneNumberString:String?
    
    override init() {
        super.init()
        
        initManager()
    }
    
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        
        if apiManager.isKindOfClass(CheckIsBoundManager){
            
        }
        
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
        }
        return dic
    }
    
    func initManager(){
        checkIsBoundManager = CheckIsBoundManager()
        checkIsBoundReformer = CheckIsBoundReformer()
        checkIsBoundManager?.callBackDelegate = self
        checkIsBoundManager?.paramSource = self
        //Model
    }
    
}

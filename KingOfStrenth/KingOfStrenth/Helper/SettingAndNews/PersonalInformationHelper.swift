//
//  PersonalInformationHelper.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/10/12.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import SwiftyJSON

protocol PersonalInformationCallBackDelegate {
    func callBackSuccess(manger:CSAPIBaseManager)
    func callBackFailure()
}

class PersonalInformationHelper: NSObject,CSAPIManagerApiCallBackDelegate, CSAPIManagerParamSourceDelegate {
    
    var personalInformationManager:PersonalInformationManager?
    var callBackDelegate:PersonalInformationCallBackDelegate?
    
    var schoolname:String?
    var nick:String?
    var student_sex:String?
    var student_name:String?
    var province_name:String?
    var student_birthday:String?
    var xueduan:String?
    
    var dic = [String: JSON]()
    
    
    // MARK: - life cycle
    override init() {
        super.init()
        
        initManager()
    }
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        if apiManager.isKindOfClass(PersonalInformationManager){
          dic = data.dictionaryValue
            callBackDelegate?.callBackSuccess(apiManager)

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
    
    func mk()->String {
        let s = NSString(format: "4fH1w90sPpIX4z%@",INFO.userId() ?? "")
        return s.stringMD5()
    }
    
    // 请求报文
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
          var dic = [String: AnyObject]()
        if manager.isKindOfClass(PersonalInformationManager){
            dic["schoolname"] = self.schoolname
            dic["nick"] = self.nick
            dic["student_sex"] = self.student_sex
            dic["student_name"] = self.student_name
            dic["province_name"] = self.province_name
            dic["student_birthday"] = self.student_birthday
            dic["xueduan"] = self.xueduan
            dic["mk"] = mk()
            dic["userID"] = INFO.userId()
//            print(dic)
        }
        return dic
    }
    
    func initManager(){
        personalInformationManager = PersonalInformationManager()
        personalInformationManager?.callBackDelegate = self
        personalInformationManager?.paramSource = self
        
    }
    

}

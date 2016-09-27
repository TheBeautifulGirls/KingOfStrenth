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

class FindPasswordHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    // 请求数据成功
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) {
        
    }
    
    // 请求失败
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType){
        
    }
    
    // 请求报文
    func paramsForApi(manager: CSAPIBaseManager) -> [String : AnyObject] {
        var dic = [String: AnyObject]()
        
        return dic
    }

}

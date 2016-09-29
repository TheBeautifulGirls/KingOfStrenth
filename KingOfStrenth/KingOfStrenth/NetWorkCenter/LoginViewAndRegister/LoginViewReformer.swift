//
//  LoginViewReformer.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/26.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSNetManager

class LoginViewReformer: CSReformer {
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        if manager.isKindOfClass(LoginViewManager) {
            var loginJSON = data
            let loginModel = LoginModel(studentName: loginJSON["student_name"].stringValue, userId: loginJSON["user_id"].stringValue, xueduan: loginJSON["xueduan"].stringValue, city: loginJSON["city"].stringValue, studentPhone: loginJSON["student_phone"].stringValue, parentPhone: loginJSON["parent_phone"].stringValue, schoolId: loginJSON["school_id"].stringValue)
            
            return loginModel
        }
        return LoginModel()
    }
}
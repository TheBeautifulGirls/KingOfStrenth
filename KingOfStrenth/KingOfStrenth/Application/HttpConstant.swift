//
//  HttpConstant.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/22.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation

class HttpConstant {
    
    private static let Manager = HttpConstant()
    class var shareInstance: HttpConstant {
        return Manager
    }
    
    // MARK: -- 服务器正式环境 --
    static let URLAPI = "http://api.huixueyuan.cn/ifdood_dev01/v2"
    static let NURLAPI = "http://api.huixueyuan.cn/ifdood_dev01"
    static let CoursreBagURLAPI = "http://sos.huixueyun.com/jiaoxue"
    static let ZNJF_API = "http://sos.huixueyun.com/api/diag"
    
    
    //MARK: -- 登录注册 --
    static let checkMac = "/users/checkMac.php"
    static let getStudentInfoById = "/xitongshezhi/getStudentInfoById.php"
    static let userRegister = "/xitong/userRegister.php"
    static let userRegisterApp = "/xitong/userRegisterApp.php"
    static let getUserInfo = "/comm/getUserInfo_0415.php?rid=12748"
    static let userLogoutApp = "/xitong/userlogout_app.php"
    static let checkIsBound = "/xitong/checkPhone.php"
    
    
    // 获取验证码正式环境
    static let getCodeAPI = "http://sms.huixueyuan.cn/sms/sms/productValidateCode?type=ios&phone=%@&sign=%@"
    static let ideCodeAPI = "http://sms.huixueyuan.cn/sms/sms/validCode?phone=%@&code=%@&sign=%@"
    // 获取验证码测试环境
    //    static let getCodeAPI = "http://192.168.12.149/sms/sms/productValidateCode?type=ios&phone=%@&sign=%@"
    //    static let ideCodeAPI = "http://192.168.12.149/sms/sms/validCode?phone=%@&code=%@&sign=%@"
    static let checkUserName = "/xitong/checkUserName.php"
    static let userProtocol = "/comm/updateUserIsagree.php"
    static let findPassWord = "/xitong/findPassWord.php"
}
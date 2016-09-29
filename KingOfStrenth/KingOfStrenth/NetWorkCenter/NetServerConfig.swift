//
//  NetServerConfig.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/26.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import CSNetManager

// MARK: 设置不同的环境 预上线，上线，测试, 下线
public let kServer = CSServer(serverType: ServerType.OnLine,
                              online: "http://api.huixueyuan.cn/ifdood_dev01/v2",
                              offline: "http://192.168.12.227/ifdood_dev01/v2",
                              prepareOnLine: "http://210.51.161.50/ifdood_dev01/v2",
                              localLine: "http://api.huixueyuan.cn/ifdood_dev01/v2")


public let codeServer = CSServer(serverType: ServerType.OnLine,
                              online: "http://sms.huixueyuan.cn/sms/sms",
                              offline: "http://192.168.12.227/ifdood_dev01/v2",
                              prepareOnLine: "http://210.51.161.50/ifdood_dev01/v2",
                              localLine: "http://api.huixueyuan.cn/ifdood_dev01/v2")
//
//  MessageModel.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class MessageModel: NSObject {
    
    var newMessages: Int?
    
    override init() {
        super.init()
    }
    
    init(newMessages: Int) {
        self.newMessages = newMessages
    }
    
}

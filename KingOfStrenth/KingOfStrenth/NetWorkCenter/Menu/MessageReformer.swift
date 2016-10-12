//
//  MessageReformer.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import SwiftyJSON

class MessageReformer: CSReformer {
    
    func reformData(manager: CSAPIBaseManager, data: JSON) -> AnyObject {
        let dataJSON = data
        
        if manager.isKindOfClass(MessageManager) {
            let messageModel = MessageModel(newMessages: dataJSON["newMessages"].intValue)
            
            return messageModel
        }
        return MessageModel()
    }
}

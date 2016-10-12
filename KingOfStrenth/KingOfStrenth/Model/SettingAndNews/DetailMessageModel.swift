//
//  DetailMessageModel.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/10/8.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailMessageModel: NSObject {
    var mesArray: [MesDetailModel]?
    var newMessages: String?
    
    override init() {
        super.init()
    }
    
    init(mesArray: [MesDetailModel], newMessages: String) {
        self.mesArray = mesArray
        self.newMessages = newMessages
    }
}

class MesDetailModel: NSObject {
    
    var title: String?
    var created: String?
    var contenturl: String?
    var comment: String?
    var id: String?
    var status: String?
    
    override init() {
        super.init()
    }
    
    init(title: String, created: String, contenturl: String, comment: String, id: String, status: String) {
        self.title = title
        self.created = created
        self.contenturl = contenturl
        self.comment = comment
        self.id = id
        self.status = status
    }
}

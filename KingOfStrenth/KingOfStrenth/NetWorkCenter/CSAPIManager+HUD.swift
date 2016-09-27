//
//  CSAPIManager+HUD.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/27.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import MBProgressHUD
import CSNetManager

extension CSAPIBaseManager {
    public func showHUD() {
        MBProgressHUD.showHUDAddedTo(showHUDView, animated: false)
    }
    public func hideHUD() {
        MBProgressHUD.hideHUDForView(showHUDView, animated: false)
    }
}
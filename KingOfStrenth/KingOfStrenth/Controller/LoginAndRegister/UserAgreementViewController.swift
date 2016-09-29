//
//  UserAgreementViewController.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import MBProgressHUD
import RealReachability

class UserAgreementViewController: BaseViewController {
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        layoutPageSubViews()
    }
    
    //MARK: - prinvate methods
    func initBaseLayout(){
        self.view.backgroundColor = UIColor.whiteColor()
        initNavigationBar("loginandregister_userProtocol_title_iphone", showLeft: true, showRight: false)
        self.view.addSubview(webView)
    }
    func layoutPageSubViews() {
        webView.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(44)
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(SCREEN_HEIGHT-44)
        }
    }
    
    //MAKE: - setter and getter
    var _webView: UIWebView!
    var webView: UIWebView {
        if _webView == nil {
            _webView = UIWebView()
            _webView.backgroundColor = UIColor.clearColor()
            _webView.opaque = false
            _webView.delegate = self
            _webView.dataDetectorTypes = .None
            _webView.scalesPageToFit = false
            let url = "http://api.huixueyuan.cn/ifdood_dev01/v2/link/yonghuxieyi.html"
            let URL = NSURL(string: url)
            let request = NSURLRequest(URL: URL!)
            _webView.loadRequest(request)

        }
        return _webView
    }
    
}
extension UserAgreementViewController: UIWebViewDelegate {
    
}
//
//  MessageViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    var userId: String?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        layoutPageSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - private method
    func initBaseLayout() {
        self.view.addSubview(backImageView)
        self.initNavigationBar("navgationbar_Message_icon_normal_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(messageTable)
    }
    
    func layoutPageSubViews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        messageTable.snp_makeConstraints { (make) in
            make.left.equalTo(self.view.snp_left).offset(20)
            make.top.equalTo(self.view.snp_top).offset(74)
            make.right.equalTo(self.view.snp_right).offset(-20)
            make.bottom.equalTo(self.view.snp_bottom).offset(-13)
        }
    }
    
    // MARK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.image = UIImage(named: "Message_backgroung_icon_normal_iPhone")
        }
        return _backImageView
    }
    
    var _messageTable: UITableView!
    var messageTable: UITableView {
        if _messageTable == nil {
            _messageTable = UITableView()
            _messageTable.backgroundColor = UIColor.whiteColor()
            _messageTable.delegate = self
            _messageTable.dataSource = self
        }
        return _messageTable
    }
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let string = "cellID"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(string)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: string)
        }
        
        cell!.textLabel?.text = "我是一个粉刷匠"
        
        return cell!
    }
}

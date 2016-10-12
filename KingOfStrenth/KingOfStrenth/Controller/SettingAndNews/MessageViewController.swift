//
//  MessageViewController.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager


class MessageViewController: BaseViewController {

    var userId: String?
    var detailMessageHelper: DetailMessageViewHelper?
    var pageNow = 1
    var dataSource: [MesDetailModel]?
    var dataArr: [MesDetailModel]?
    var read: String?
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayout()
        layoutPageSubViews()
        initHelper()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - private method
    func initBaseLayout() {
        self.view.addSubview(backImageView)
        self.initNavigationBar("navgationbar_Message_icon_normal_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(messageTable)
        self.view.addSubview(clearBtn)
        self.view.addSubview(readBtn)
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
        clearBtn.snp_makeConstraints { (make) in
            make.right.equalTo(self.view.snp_right).offset(-98)
            make.top.equalTo(self.view).offset(38.5)
            make.height.equalTo(27)
            make.width.equalTo(70)
        }
        readBtn.snp_makeConstraints { (make) in
            make.right.equalTo(self.view.snp_right).offset(-18)
            make.top.equalTo(self.view).offset(38.5)
            make.height.equalTo(27)
            make.width.equalTo(70)
        }
    }
    
    func initHelper() {
        dataSource = [MesDetailModel]()
        
        detailMessageHelper = DetailMessageViewHelper()
        detailMessageHelper?.callBackDelegate = self
        detailMessageHelper?.detailMessageManager!.loadData()
        detailMessageHelper?.detailMessageManager!.showHUDView = self.view
        detailMessageHelper?.detailMessageManager!.showHUDView
        detailMessageHelper?.messageViewController = self
    }
    
    // 下拉刷新
    func updateData() {
        self.pageNow = 1
        dataArr?.removeAll()
        detailMessageHelper?.pageNow = self.pageNow
        detailMessageHelper?.detailMessageManager!.loadData()
        detailMessageHelper?.detailMessageManager!.showHUDView = self.view
        detailMessageHelper?.detailMessageManager!.showHUDView
    }
    
    // 上拉加载
    func loadData() {
        self.pageNow += 1
        detailMessageHelper?.pageNow = self.pageNow
        detailMessageHelper?.detailMessageManager!.loadData()
        detailMessageHelper?.detailMessageManager!.showHUDView = self.view
        detailMessageHelper?.detailMessageManager!.showHUDView
    }
    
    // 清空消息
    func clearMessage(sender: UIButton) {
        YAlertViewController.showAlertControllerCompleion({
            
            self.detailMessageHelper?.clearMessageManager?.loadData()
            self.detailMessageHelper?.clearMessageManager?.showHUDView = self.view
            self.detailMessageHelper?.clearMessageManager?.showHUD()
            
            }, view: self, title: "提示", message: "确定清空消息吗？")
    }
    
    // 置为已读
    func readAllMessage(sender: UIButton) {
        YAlertViewController.showAlertControllerCompleion({
            
            self.detailMessageHelper?.messageId = ""
            self.detailMessageHelper?.changeStatusManager?.loadData()
            self.detailMessageHelper?.changeStatusManager?.showHUDView = self.view
            self.detailMessageHelper?.changeStatusManager?.showHUD()
            
            }, view: self, title: "提示", message: "确定全部标记为已读吗？")
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
            _messageTable.backgroundColor = UIColor(hexString: "#ebebeb")
            _messageTable.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(MessageViewController.updateData))
            _messageTable.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(MessageViewController.loadData))
            _messageTable.registerClass(MessageCell.self, forCellReuseIdentifier: "cellID")
            
        }
        return _messageTable
    }
    
    var _clearBtn: UIButton!
    var clearBtn: UIButton {
        if _clearBtn == nil {
            _clearBtn = UIButton()
            _clearBtn.setBackgroundImage(UIImage(named: "Message_clean_btn_normal_iPhone"), forState: .Normal)
            _clearBtn.setBackgroundImage(UIImage(named: "Message_clean_btn_selected_iPhone"), forState: .Highlighted)
            _clearBtn.addTarget(self, action: #selector(MessageViewController.clearMessage(_:)), forControlEvents: .TouchUpInside)
        }
        return _clearBtn
    }
    
    var _readBtn: UIButton!
    var readBtn: UIButton {
        if _readBtn == nil {
            _readBtn = UIButton()
            _readBtn.setBackgroundImage(UIImage(named: "Message_markRead_btn_normal_iPhone"), forState: .Normal)
            _readBtn.setBackgroundImage(UIImage(named: "Message_markRead_btn_selected_iPhone"), forState: .Highlighted)
            _readBtn.addTarget(self, action: #selector(MessageViewController.readAllMessage(_:)), forControlEvents: .TouchUpInside)
        }
        return _readBtn
    }
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataSource?.count)!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let string = "cellID"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(string, forIndexPath: indexPath) as! MessageCell
       
        
        if dataSource?.count > 0 {
            cell.titleLabel.text = dataSource![indexPath.row].title
            cell.dateLabel.text = dataSource![indexPath.row].created
            if dataSource![indexPath.row].status == "0" {
                cell.mesImageView.image = UIImage(named: "Message_unread_icon_normal_iPhone")
            } else {
                cell.mesImageView.image = UIImage(named: "Message_read_icon_normal_iPhone")
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let DMVC = DetailMessageViewController()
        DMVC.content = self.dataSource![indexPath.row].contenturl
        
        if self.dataSource![indexPath.row].status! == "0" { // 未读
            self.dataSource![indexPath.row].status! = "1"
            detailMessageHelper?.messageId = self.dataSource![indexPath.row].id
            // 改变消息状态
            detailMessageHelper?.changeStatusManager?.loadData()
            detailMessageHelper?.changeStatusManager?.showHUDView = self.view
            detailMessageHelper?.changeStatusManager?.showHUD()
            self.messageTable.reloadData()
        }
        
        self.navigationController?.pushViewController(DMVC, animated: true)
    }
}
extension MessageViewController: DetailMessageViewCallBackDelegate {
    func callBackSuccess(manager: CSAPIBaseManager) {
        if manager.isKindOfClass(DetailMessageManager) {
            
//            if detailMessageHelper!.detailMessageModel.mesArray!.count > 0 || (dataSource != nil && dataSource!.count > 0) {
            
                if detailMessageHelper!.detailMessageModel.mesArray!.count > 0 {
                    
                    if dataArr == nil {
                        dataArr = [MesDetailModel]()
                    }
                    
                    for i in 0 ..< detailMessageHelper!.detailMessageModel.mesArray!.count {
                        dataArr?.append(detailMessageHelper!.detailMessageModel.mesArray![i])
                    }
                    self.dataSource = dataArr
//                }
            }
            self.messageTable.reloadData()
            self.messageTable.mj_header.endRefreshing()
            self.messageTable.mj_footer.endRefreshing()
        }
        
        if manager.isKindOfClass(ChangeStatusManager) {
            
            self.updateData()
        }
        
        if manager.isKindOfClass(ClearMessageManager) {
            self.dataSource?.removeAll()
            self.messageTable.reloadData()
        }
        
    }
    
    func callBackFailure() {
        
    }
}
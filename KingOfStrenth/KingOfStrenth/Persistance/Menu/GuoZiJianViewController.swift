//
//  GuoZiJianViewController.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/11.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager
import SwiftyJSON

class GuoZiJianViewController: BaseViewController, GuoZiJianViewCallBackDelegate {
    
    var gzjHelper: GuoZiJianViewControllerHelper?
    var dataSource: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initBaseLayout()
        layoutPageSubViews()
    }
    
    func initBaseLayout() {
        initNavigationBar("navigationbar_imperialCollege_icon_normol_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(backImageView)
        backImageView.addSubview(rightImageView)
        backImageView.addSubview(mathBtn)
        backImageView.addSubview(physicsBtn)
        backImageView.addSubview(chemistryBtn)
        backImageView.addSubview(englishBtn)
        backImageView.addSubview(chineseBtn)
        rightImageView.addSubview(synchronizedVideoBtn)
        rightImageView.addSubview(topicVideoBtn)
        rightImageView.addSubview(synchronizedVideoImage)
        rightImageView.addSubview(middleTopicVideoImage)
        
    }
    
    // MARK: - private cycle
    func layoutPageSubViews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(44, 0, 0, 0))
        }
        rightImageView.snp_makeConstraints { (make) in
            make.top.equalTo(backImageView.snp_top).offset(0)
            make.right.equalTo(backImageView.snp_right).offset(0)
            make.bottom.equalTo(backImageView.snp_bottom).offset(0)
            make.left.equalTo(backImageView.snp_left).offset(140/736*WIDTH)
        }
        mathBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(backImageView.snp_top).offset(18/414*HEIGHT)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        physicsBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(mathBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        chemistryBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(physicsBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        englishBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(chemistryBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        chineseBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(2/736*WIDTH)
            make.top.equalTo(englishBtn.snp_bottom).offset(0)
            make.width.equalTo(135/736*WIDTH)
            make.height.equalTo(48/414*HEIGHT)
        }
        synchronizedVideoBtn.snp_makeConstraints { (make) in
            make.left.equalTo(rightImageView.snp_left).offset(130/736*WIDTH)
            make.top.equalTo(rightImageView.snp_top).offset(70/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(120/414*HEIGHT)
        }
        
        topicVideoBtn.snp_makeConstraints { (make) in
            make.left.equalTo(synchronizedVideoBtn.snp_right).offset(120/736*WIDTH)
            make.top.equalTo(rightImageView.snp_top).offset(70/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(120/414*HEIGHT)
        }
        
        synchronizedVideoImage.snp_makeConstraints { (make) in
            make.left.equalTo(rightImageView.snp_left).offset(120/736*WIDTH)
            make.top.equalTo(synchronizedVideoBtn.snp_bottom).offset(20/414*HEIGHT)
            make.width.equalTo(130/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        middleTopicVideoImage.snp_makeConstraints { (make) in
            make.left.equalTo(synchronizedVideoBtn.snp_right).offset(90/736*WIDTH)
            make.top.equalTo(topicVideoBtn.snp_bottom).offset(20/414*HEIGHT)
            make.width.equalTo(180/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        //        chineseTableView.snp_makeConstraints { (make) in
        //            make.left.equalTo(rightImageView.snp_left).offset(0)
        //            make.top.equalTo(rightImageView.snp_top).offset(0)
        //            make.right.equalTo(rightImageView.snp_right).offset(0)
        //            make.bottom.equalTo(rightImageView.snp_bottom).offset(0)
        //        }
    }
    
    // MARK: - private method
    func initHelper() {
        gzjHelper = GuoZiJianViewControllerHelper()
        gzjHelper?.callBackDelegate = self
        gzjHelper?.guoZiJianViewController = self
        
        gzjHelper?.guoZiJianManager?.loadData()
    }
    
    func callBackSuccess(manager: CSAPIBaseManager) {
        if manager.isKindOfClass(GuoZiJianManager) {
            dataSource = gzjHelper?.guoZiJianModel.dataSource
            print(dataSource)
            chineseTableView.reloadData()
        }
        
    }
    
    func callBackFailure() {
        
    }
    
    // MARK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.userInteractionEnabled = true
            _backImageView.image = UIImage(named: "Archives_BackGround_icon_iPhone")
        }
        return _backImageView
    }
    
    var _rightImageView: UIImageView!
    var rightImageView: UIImageView {
        if _rightImageView == nil {
            _rightImageView = UIImageView()
            _rightImageView.userInteractionEnabled = true
            _rightImageView.image = UIImage(named: "ImperialCollege_Chinesebg_icon_normol_iPhone")
        }
        return _rightImageView
    }
    
    var _mathBtn: UIButton!
    var mathBtn: UIButton {
        if _mathBtn == nil {
            _mathBtn = UIButton()
            _mathBtn.tag = 1001
            _mathBtn.setBackgroundImage(UIImage(named: "couse_Math_btn_normal_iPhone"), forState: .Normal)
            _mathBtn.setBackgroundImage(UIImage(named: "couse_Math_btn_selected_iPhone"), forState: .Selected)
            _mathBtn.addTarget(self, action: #selector(GuoZiJianViewController.mathBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _mathBtn
    }
    
    var _physicsBtn: UIButton!
    var physicsBtn: UIButton {
        if _physicsBtn == nil {
            _physicsBtn = UIButton()
            _physicsBtn.tag = 1002
            _physicsBtn.setBackgroundImage(UIImage(named: "couse_Physics_btn_normal_iPhone"), forState: .Normal)
            _physicsBtn.setBackgroundImage(UIImage(named: "couse_Physics_btn_selected_iPhone"), forState: .Selected)
            _physicsBtn.addTarget(self, action: #selector(GuoZiJianViewController.physicsBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _physicsBtn
    }
    
    var _chemistryBtn: UIButton!
    var chemistryBtn: UIButton {
        if _chemistryBtn == nil {
            _chemistryBtn = UIButton()
            _chemistryBtn.tag = 1003
            _chemistryBtn.setBackgroundImage(UIImage(named: "couse_Chemical_btn_normal_iPhone"), forState: .Normal)
            _chemistryBtn.setBackgroundImage(UIImage(named: "couse_Chemical_btn_selected_iPhone"), forState: .Selected)
            _chemistryBtn.addTarget(self, action: #selector(GuoZiJianViewController.chemistryBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _chemistryBtn
    }
    
    var _englishBtn: UIButton!
    var englishBtn: UIButton {
        if _englishBtn == nil {
            _englishBtn = UIButton()
            _englishBtn.tag = 1004
            _englishBtn.setBackgroundImage(UIImage(named: "couse_English_btn_normal_iPhone"), forState: .Normal)
            _englishBtn.setBackgroundImage(UIImage(named: "couse_English_btn_selected_iPhone"), forState: .Selected)
            _englishBtn.addTarget(self, action: #selector(GuoZiJianViewController.englishBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _englishBtn
    }
    
    var _chineseBtn: UIButton!
    var chineseBtn: UIButton {
        if _chineseBtn == nil {
            _chineseBtn = UIButton()
            _chineseBtn.tag = 1005
            _chineseBtn.setBackgroundImage(UIImage(named: "couse_Chinese_btn_normal_iPhone"), forState: .Normal)
            _chineseBtn.setBackgroundImage(UIImage(named: "couse_Chinese_btn_selected_iPhone"), forState: .Selected)
            _chineseBtn.addTarget(self, action: #selector(GuoZiJianViewController.chineseBtnClick(_:)), forControlEvents: .TouchUpInside)
        }
        return _chineseBtn
    }
    
    var _synchronizedVideoBtn: UIButton!
    var synchronizedVideoBtn: UIButton {
        if _synchronizedVideoBtn == nil {
            _synchronizedVideoBtn = UIButton()
            _synchronizedVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_synchronizedVideo_btn_normol_iPhone"), forState: .Normal)
            _synchronizedVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_synchronizedVideo_btn_selected_iPhone"), forState: .Highlighted)
        }
        return _synchronizedVideoBtn
    }
    
    var _topicVideoBtn: UIButton!
    var topicVideoBtn: UIButton {
        if _topicVideoBtn == nil {
            _topicVideoBtn = UIButton()
            _topicVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_topicVideo_btn_normol_iPhone"), forState: .Normal)
            _topicVideoBtn.setBackgroundImage(UIImage(named: "ImperialCollege_topicVideo_btn_selected_iPhone"), forState: .Highlighted)
        }
        return _topicVideoBtn
    }
    
    var _synchronizedVideoImage: UIImageView!
    var synchronizedVideoImage: UIImageView {
        if _synchronizedVideoImage == nil {
            _synchronizedVideoImage = UIImageView()
            _synchronizedVideoImage.image = UIImage(named: "ImperialCollege_synchronizedVideo_icon_normol_iPhone")
        }
        return _synchronizedVideoImage
    }
    
    var _middleTopicVideoImage: UIImageView!
    var middleTopicVideoImage: UIImageView {
        if _middleTopicVideoImage == nil {
            _middleTopicVideoImage = UIImageView()
            _middleTopicVideoImage.image = UIImage(named: "ImperialCollege_middleTopicVideo_icon_normol_iPhone")
        }
        return _middleTopicVideoImage
    }
    
    var _chineseTableView: UITableView!
    var chineseTableView: UITableView {
        if _chineseTableView == nil {
            _chineseTableView = UITableView()
            _chineseTableView.backgroundColor = UIColor.clearColor()
            _chineseTableView.delegate = self
            _chineseTableView.dataSource = self
            _chineseTableView.registerClass(gzjCell.self, forCellReuseIdentifier: "cell")
        }
        return _chineseTableView
    }
    
    var _cellLabel:UILabel!
    var cellLabel: UILabel {
        if _cellLabel == nil {
            _cellLabel = UILabel()
            _cellLabel.textColor = UIColor.init(colorLiteralRed: 174/255.0, green: 13/255.0, blue: 11/255.0, alpha: 1)
        }
        return _cellLabel
    }
    
    //MARK: - event response
    func mathBtnClick(sender:AnyObject) {
        if sender.tag == 1001 {
            chineseTableView.hidden = true
            synchronizedVideoBtn.hidden = false
            topicVideoBtn.hidden = false
            synchronizedVideoImage.hidden = false
            middleTopicVideoImage.hidden = false
        }
        mathBtn.selected = true
        physicsBtn.selected = false
        chemistryBtn.selected = false
        englishBtn.selected = false
        chineseBtn.selected = false
    }
    
    func physicsBtnClick(sender:AnyObject) {
        if sender.tag == 1002 {
            chineseTableView.hidden = true
            synchronizedVideoBtn.hidden = false
            topicVideoBtn.hidden = false
            synchronizedVideoImage.hidden = false
            middleTopicVideoImage.hidden = false
        }
        physicsBtn.selected = true
        mathBtn.selected = false
        chemistryBtn.selected = false
        englishBtn.selected = false
        chineseBtn.selected = false
    }
    
    func chemistryBtnClick(sender:AnyObject) {
        if sender.tag == 1003 {
            chineseTableView.hidden = true
            synchronizedVideoBtn.hidden = false
            topicVideoBtn.hidden = false
            synchronizedVideoImage.hidden = false
            middleTopicVideoImage.hidden = false
        }
        chemistryBtn.selected = true
        mathBtn.selected = false
        physicsBtn.selected = false
        englishBtn.selected = false
        chineseBtn.selected = false
    }
    
    func englishBtnClick(sender:AnyObject) {
        if sender.tag == 1004 {
            chineseTableView.hidden = true
            synchronizedVideoBtn.hidden = false
            topicVideoBtn.hidden = false
            synchronizedVideoImage.hidden = false
            middleTopicVideoImage.hidden = false
        }
        englishBtn.selected = true
        chemistryBtn.selected = false
        mathBtn.selected = false
        physicsBtn.selected = false
        chineseBtn.selected = false
    }
    
    func chineseBtnClick(sender:AnyObject) {
        
        rightImageView.addSubview(chineseTableView)
        chineseTableView.snp_makeConstraints { (make) in
            make.left.equalTo(rightImageView.snp_left).offset(0)
            make.top.equalTo(rightImageView.snp_top).offset(0)
            make.right.equalTo(rightImageView.snp_right).offset(0)
            make.bottom.equalTo(rightImageView.snp_bottom).offset(0)
        }
        initHelper()
        if sender.tag == 1005 {
            chineseTableView.hidden = false
            synchronizedVideoBtn.hidden = true
            topicVideoBtn.hidden = true
            synchronizedVideoImage.hidden = true
            middleTopicVideoImage.hidden = true
        }
        chineseBtn.selected = true
        englishBtn.selected = false
        chemistryBtn.selected = false
        mathBtn.selected = false
        physicsBtn.selected = false
    }
}

extension GuoZiJianViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSource?.count > 0 {
            return (dataSource?["data"].count)!
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let string = "cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(string, forIndexPath: indexPath) as! gzjCell
        
        if dataSource?["data"].count > 0 {
            cell.titleLabel.text = String(dataSource!["data"][indexPath.row]["name"])
        }
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        //        cell!.textLabel?.text = String(dataSource!["data"][indexPath.row]["name"])
        return cell
    }
}


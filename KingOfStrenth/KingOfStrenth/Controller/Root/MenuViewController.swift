//
//  MenuViewController.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/9/26.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import CSNetManager

let WIDTH = UIScreen.mainScreen().bounds.size.width
let HEIGHT = UIScreen.mainScreen().bounds.size.height

class MenuViewController: BaseViewController, MenuViewCallBackDelegate {
    
    var userId: String?
    var menuHelper: MenuViewControllerHelper?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.mainScreen().bounds.size)
        
        initBaseLayout()
        layoutPageSubViews()
        
        initHelper()
        menuHelper?.menuManager?.loadData()
    }
    
    func initHelper() {
        menuHelper = MenuViewControllerHelper()
        menuHelper?.callBackDelegate = self
        menuHelper?.menuViewController = self
    }
    
    func callBackSuccess(manger: CSAPIBaseManager) {
        if manger.isKindOfClass(UserInfoManager){
          print("啊啊啊啊啊啊啊")
            let model = menuHelper!.menuModel
            print(".........",model)
            let xueduan = NSUserDefaults.standardUserDefaults()
            xueduan.setObject(model.xueduan, forKey: "userPhase")
            xueduan.synchronize()
        }
    }
    
    func callBackFailure() {
        
    }
    // MARK: - private cycle
    func layoutPageSubViews() {
        backImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    
        
        rightTopBg.snp_makeConstraints { (make) in
            make.top.equalTo(backImageView.snp_top).offset(20/414*HEIGHT)
            make.right.equalTo(backImageView.snp_right).offset(-10/736*WIDTH)
            make.width.equalTo(284.5/736*WIDTH)
            make.height.equalTo(38/414*HEIGHT)
        }
        
        avatarBg.snp_makeConstraints { (make) in
            make.top.equalTo(backImageView.snp_top).offset(10/414*HEIGHT)
            make.left.equalTo(backImageView.snp_left).offset(10/736*WIDTH)
            make.width.equalTo(180/736*WIDTH)
            make.height.equalTo(58/414*HEIGHT)
        }
        
        gzjBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(50/736*WIDTH)
            make.top.equalTo(backImageView.snp_top).offset(130/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        godListBtn.snp_makeConstraints { (make) in
            make.left.equalTo(gzjBtn.snp_right).offset(5/736*WIDTH)
            make.top.equalTo(backImageView.snp_top).offset(90/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        enbuSiteBtn.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(75/736*WIDTH)
            make.top.equalTo(gzjBtn.snp_bottom).offset(64/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        taskBtn.snp_makeConstraints { (make) in
            make.left.equalTo(godListBtn.snp_right).offset(18/736*WIDTH)
            make.top.equalTo(backImageView.snp_top).offset(78/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        archivesBtn.snp_makeConstraints { (make) in
            make.right.equalTo(backImageView.snp_right).offset(-15/736*WIDTH)
            make.top.equalTo(rightTopBg.snp_bottom).offset(105/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        championBtn.snp_makeConstraints { (make) in
            make.right.equalTo(archivesBtn.snp_left).offset(-45/736*WIDTH)
            make.top.equalTo(rightTopBg.snp_bottom).offset(70/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        hygBtn.snp_makeConstraints { (make) in
            make.right.equalTo(championBtn.snp_left).offset(15/736*WIDTH)
            make.top.equalTo(taskBtn.snp_bottom).offset(50/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        practiceBtn.snp_makeConstraints { (make) in
            make.right.equalTo(backImageView.snp_right).offset(-202/736*WIDTH)
            make.top.equalTo(hygBtn.snp_bottom).offset(68/414*HEIGHT)
            make.width.equalTo(120/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        servicesBtn.snp_makeConstraints { (make) in
            make.left.equalTo(rightTopBg.snp_left).offset(100/736*WIDTH)
            make.top.equalTo(rightTopBg.snp_top).offset(0)
            make.bottom.equalTo(rightTopBg.snp_bottom).offset(0)
            make.width.equalTo(36/736*WIDTH)
        }
        
        messageBtn.snp_makeConstraints { (make) in
            make.left.equalTo(servicesBtn.snp_right).offset(10/736*WIDTH)
            make.top.equalTo(rightTopBg.snp_top).offset(0)
            make.bottom.equalTo(rightTopBg.snp_bottom).offset(0)
            make.width.equalTo(36/736*WIDTH)
        }
        
        settingBtn.snp_makeConstraints { (make) in
            make.left.equalTo(messageBtn.snp_right).offset(10/736*WIDTH)
            make.top.equalTo(rightTopBg.snp_top).offset(0)
            make.bottom.equalTo(rightTopBg.snp_bottom).offset(0)
            make.width.equalTo(40/736*WIDTH)
        }
        
        nickName.snp_makeConstraints { (make) in
            make.left.equalTo(avatarBg.snp_left).offset(65/736*WIDTH)
            make.top.equalTo(avatarBg.snp_top).offset(9/414*HEIGHT)
            make.width.equalTo(40/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        nickNameTxt.snp_makeConstraints { (make) in
            make.left.equalTo(nickName.snp_right).offset(0)
            make.top.equalTo(avatarBg.snp_top).offset(9/414*HEIGHT)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        level.snp_makeConstraints { (make) in
            make.left.equalTo(avatarBg.snp_left).offset(65/736*WIDTH)
            make.top.equalTo(nickName.snp_bottom).offset(3/414*HEIGHT)
            make.width.equalTo(40/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        levelTxt.snp_makeConstraints { (make) in
            make.left.equalTo(level.snp_right).offset(0)
            make.top.equalTo(nickName.snp_bottom).offset(3/414*HEIGHT)
            make.width.equalTo(40/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        fdCoin.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(20/736*WIDTH)
            make.top.equalTo(avatarBg.snp_bottom).offset(0)
            make.width.equalTo(50/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        fdCoinTxt.snp_makeConstraints { (make) in
            make.left.equalTo(fdCoin.snp_right).offset(5/736*WIDTH)
            make.top.equalTo(avatarBg.snp_bottom).offset(0)
            make.width.equalTo(60/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        hxStar.snp_makeConstraints { (make) in
            make.left.equalTo(backImageView.snp_left).offset(20/736*WIDTH)
            make.top.equalTo(fdCoin.snp_bottom).offset(0)
            make.width.equalTo(60/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
        
        hxStarTxt.snp_makeConstraints { (make) in
            make.left.equalTo(hxStar.snp_right).offset(0)
            make.top.equalTo(fdCoin.snp_bottom).offset(0)
            make.width.equalTo(60/736*WIDTH)
            make.height.equalTo(20/414*HEIGHT)
        }
    }
    
    func initBaseLayout(){
        
        let userInfo = LoginAndRegisterDataCenter()
        self.userId = userInfo.userId()
        
        self.view.addSubview(backImageView)
        self.view.addSubview(rightTopBg)
        self.view.addSubview(avatarBg)
        self.backImageView.addSubview(gzjBtn)
        self.backImageView.addSubview(godListBtn)
        self.backImageView.addSubview(enbuSiteBtn)
        self.backImageView.addSubview(taskBtn)
        self.backImageView.addSubview(archivesBtn)
        self.backImageView.addSubview(championBtn)
        self.backImageView.addSubview(hygBtn)
        self.backImageView.addSubview(practiceBtn)
        self.rightTopBg.addSubview(servicesBtn)
        self.rightTopBg.addSubview(messageBtn)
        self.rightTopBg.addSubview(settingBtn)
        self.avatarBg.addSubview(nickName)
        self.avatarBg.addSubview(nickNameTxt)
        self.avatarBg.addSubview(level)
        self.avatarBg.addSubview(levelTxt)
        self.backImageView.addSubview(fdCoin)
        self.backImageView.addSubview(fdCoinTxt)
        self.backImageView.addSubview(hxStar)
        self.backImageView.addSubview(hxStarTxt)
    }
    
    // MARK: - setters and getters
    var _backImageView: UIImageView!
    var backImageView: UIImageView {
        if _backImageView == nil {
            _backImageView = UIImageView()
            _backImageView.userInteractionEnabled = true
            _backImageView.image = UIImage(named: "Menu_background_icon_normal_iPhone")
        }
        return _backImageView
    }
    
    // MARK: - setters and getters
    var _rightTopBg:UIImageView!
    var rightTopBg:UIImageView {
        if _rightTopBg == nil {
            _rightTopBg = UIImageView()
            _rightTopBg.userInteractionEnabled = true
            _rightTopBg.image = UIImage(named: "Menu_rightTopBg_icon_normal_iPhone")
        }
        return _rightTopBg
    }
    
    var _avatarBg:UIImageView!
    var avatarBg:UIImageView {
        if _avatarBg == nil {
            _avatarBg = UIImageView()
            _avatarBg.userInteractionEnabled = true
            _avatarBg.image = UIImage(named: "Menu_avatarBg_icon_normal_iPhone")
        }
        return _avatarBg
    }
    
    var _gzjBtn:UIButton!
    var gzjBtn:UIButton {
        if _gzjBtn == nil {
            _gzjBtn = UIButton()
            _gzjBtn.setBackgroundImage(UIImage(named: "Menu_ImperialCollege_btn_normal_iPhone"), forState: .Normal)
            _gzjBtn.setBackgroundImage(UIImage(named: "Menu_ImperialCollege_btn_selected_iPhone"), forState: .Highlighted)
            _gzjBtn.addTarget(self, action: #selector(MenuViewController.gzjAction(_:)), forControlEvents: .TouchUpInside)
        }
        return _gzjBtn
    }
    
    //国子监
    func gzjAction(sender:AnyObject) {
        
    }
    
    var _godListBtn:UIButton!
    var godListBtn:UIButton {
        if _godListBtn == nil {
            _godListBtn = UIButton()
            _godListBtn.setBackgroundImage(UIImage(named: "Menu_godList_btn_normal_iPhone"), forState: .Normal)
            _godListBtn.setBackgroundImage(UIImage(named: "Menu_godList_btn_selected_iPhone"), forState: .Highlighted)
            _godListBtn.addTarget(self, action: #selector(MenuViewController.goldList(_:)), forControlEvents: .TouchUpInside)
        }
        return _godListBtn
    }
    
    //封神榜
    func goldList(sender:AnyObject) {
        
    }
    
    var _enbuSiteBtn:UIButton!
    var enbuSiteBtn:UIButton {
        if _enbuSiteBtn == nil {
            _enbuSiteBtn = UIButton()
            _enbuSiteBtn.setBackgroundImage(UIImage(named: "Menu_enbuSite_btn_normal_iPhone"), forState: .Normal)
            _enbuSiteBtn.setBackgroundImage(UIImage(named: "Menu_enbuSite_btn_selected_iPhone"), forState: .Highlighted)
            _enbuSiteBtn.addTarget(self, action: #selector(MenuViewController.enbuSite(_:)), forControlEvents: .TouchUpInside)
        }
        return _enbuSiteBtn
    }
    
    //演武场
    func enbuSite(sender:AnyObject) {
        
    }
    
    var _taskBtn:UIButton!
    var taskBtn:UIButton {
        if _taskBtn == nil {
            _taskBtn = UIButton()
            _taskBtn.setBackgroundImage(UIImage(named: "Menu_taskPagoda_btn_normal_iPhone"), forState: .Normal)
            _taskBtn.setBackgroundImage(UIImage(named: "Menu_taskPagoda_btn_selected_iPhone"), forState: .Highlighted)
            _taskBtn.addTarget(self, action: #selector(MenuViewController.taskBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _taskBtn
    }
    
    //任务塔
    func taskBtn(sender:AnyObject) {
        
    }
    
    var _archivesBtn:UIButton!
    var archivesBtn:UIButton {
        if _archivesBtn == nil {
            _archivesBtn = UIButton()
            _archivesBtn.setBackgroundImage(UIImage(named: "Menu_archives_btn_normal_iPhone"), forState: .Normal)
            _archivesBtn.setBackgroundImage(UIImage(named: "Menu_archives_btn_selected_iPhone"), forState: .Highlighted)
            _archivesBtn.addTarget(self, action: #selector(MenuViewController.archivesBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _archivesBtn
    }
    
    //档案馆
    func archivesBtn(sender:AnyObject) {
        
    }
    
    var _championBtn:UIButton!
    var championBtn:UIButton {
        if _championBtn == nil {
            _championBtn = UIButton()
            _championBtn.setBackgroundImage(UIImage(named: "Menu_championFloor_btn_normal_iPhone"), forState: .Normal)
            _championBtn.setBackgroundImage(UIImage(named: "Menu_archives_btn_selected_iPhone"), forState: .Highlighted)
            _championBtn.addTarget(self, action: #selector(MenuViewController.championBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _championBtn
    }
    
    //状元楼
    func championBtn(sender:AnyObject) {
        
    }
    
    var _hygBtn:UIButton!
    var hygBtn:UIButton {
        if _hygBtn == nil {
            _hygBtn = UIButton()
            _hygBtn.setBackgroundImage(UIImage(named: "Menu_huiHospital_btn_normal_iPhone"), forState: .Normal)
            _hygBtn.setBackgroundImage(UIImage(named: "Menu_huiHospital_btn_selected_iPhone"), forState: .Highlighted)
            _hygBtn.addTarget(self, action: #selector(MenuViewController.hygBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _hygBtn
    }
    
    //慧医馆
    func hygBtn(sender:AnyObject) {
        
    }
    
    var _practiceBtn:UIButton!
    var practiceBtn:UIButton {
        if _practiceBtn == nil {
            _practiceBtn = UIButton()
            _practiceBtn.setBackgroundImage(UIImage(named: "Menu_practiceRoom_btn_normal_iPhone"), forState: .Normal)
            _practiceBtn.setBackgroundImage(UIImage(named: "Menu_practiceRoom_btn_selected_iPhone"), forState: .Highlighted)
            _practiceBtn.addTarget(self, action: #selector(MenuViewController.practiceBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _practiceBtn
    }
    
    //练功房
    func practiceBtn(sender:AnyObject) {
        
    }
    
    var _servicesBtn:UIButton!
    var servicesBtn:UIButton {
        if _servicesBtn == nil {
            _servicesBtn = UIButton()
            _servicesBtn.setBackgroundImage(UIImage(named: "Menu_services_btn_normal_iPhone"), forState: .Normal)
            _servicesBtn.setBackgroundImage(UIImage(named: "Menu_services_btn_selected_iPhone"), forState: .Highlighted)
            _servicesBtn.addTarget(self, action: #selector(MenuViewController.servicesBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _servicesBtn
    }
    
    //客服
    func servicesBtn(sender:AnyObject) {
        let servicesVC = ServicesViewController()
        self.navigationController?.pushViewController(servicesVC, animated: false)
        
    }
    
    var _messageBtn:UIButton!
    var messageBtn:UIButton {
        if _messageBtn == nil {
            _messageBtn = UIButton()
            _messageBtn.setBackgroundImage(UIImage(named: "Menu_message_btn_normal_iPhone"), forState: .Normal)
            _messageBtn.setBackgroundImage(UIImage(named: "Menu_message_btn_selected_iPhone"), forState: .Highlighted)
            _messageBtn.addTarget(self, action: #selector(MenuViewController.messageBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _messageBtn
    }
    
    //消息
    func messageBtn(sender:AnyObject) {
        let messageVC = MessageViewController()
        messageVC.userId = self.userId
        self.navigationController?.pushViewController(messageVC, animated: false)
    }
    
    var _settingBtn:UIButton!
    var settingBtn:UIButton {
        if _settingBtn == nil {
            _settingBtn = UIButton()
            _settingBtn.setBackgroundImage(UIImage(named: "Menu_setting_btn_normal_iPhone"), forState: .Normal)
            _settingBtn.setBackgroundImage(UIImage(named: "Menu_setting_btn_selected_iPhone"), forState: .Highlighted)
            _settingBtn.addTarget(self, action: #selector(MenuViewController.settingBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _settingBtn
    }
    
    //设置
    func settingBtn(sender:AnyObject) {
        let settingVC = SettingController()
        self.navigationController?.pushViewController(settingVC, animated: false)
        
    }
    
    var _nickName:UILabel!
    var nickName:UILabel {
        if _nickName == nil {
            _nickName = UILabel()
            _nickName.text = "昵称:"
            _nickName.textColor = UIColor.yellowColor()
            _nickName.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _nickName
    }
    
    var _nickNameTxt:UILabel!
    var nickNameTxt:UILabel {
        if _nickNameTxt == nil {
            _nickNameTxt = UILabel()
            print("用户名",userId)
            _nickNameTxt.text = "ST" + userId!
            _nickNameTxt.textColor = UIColor.yellowColor()
            _nickNameTxt.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _nickNameTxt
    }
    
    var _level:UILabel!
    var level:UILabel {
        if _level == nil {
            _level = UILabel()
            _level.text = "级别:"
            _level.textColor = UIColor.greenColor()
            _level.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _level
    }
    
    var _levelTxt:UILabel!
    var levelTxt:UILabel {
        if _levelTxt == nil {
            _levelTxt = UILabel()
            _levelTxt.text = "1"
            _levelTxt.textColor = UIColor.greenColor()
            _levelTxt.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _levelTxt
    }
    
    var _fdCoin:UILabel!
    var fdCoin:UILabel {
        if _fdCoin == nil {
            _fdCoin = UILabel()
            _fdCoin.text = "分豆币:"
            _fdCoin.textColor = UIColor.yellowColor()
            _fdCoin.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _fdCoin
    }
    
    var _fdCoinTxt:UILabel!
    var fdCoinTxt:UILabel {
        if _fdCoinTxt == nil {
            _fdCoinTxt = UILabel()
            _fdCoinTxt.text = "405"
            _fdCoinTxt.textColor = UIColor.yellowColor()
            _fdCoinTxt.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _fdCoinTxt
    }
   
    var _hxStar:UILabel!
    var hxStar:UILabel {
        if _hxStar == nil {
            _hxStar = UILabel()
            _hxStar.text = "慧学星:"
            _hxStar.textColor = UIColor.yellowColor()
            _hxStar.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _hxStar
    }
    
    var _hxStarTxt:UILabel!
    var hxStarTxt:UILabel {
        if _hxStarTxt == nil {
            _hxStarTxt = UILabel()
            _hxStarTxt.text = "0"
            _hxStarTxt.textColor = UIColor.yellowColor()
            _hxStarTxt.font = UIFont.systemFontOfSize(15/736*WIDTH)
        }
        return _hxStarTxt
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    

    
 

}

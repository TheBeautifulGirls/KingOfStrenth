//
//  CourseViewController.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit
import SwiftyJSON
import CSNetManager

class CourseViewController: BaseViewController {
    
    var courseHelper: CourseViewControllerHelper?
    //学段
    var phase: String!
    //userID
    var userID: String!
    //所有科目的数据源
    var dataSource: JSON?
    //当前科目的数据
    var currentData: JSON?
    //教材类型
    var subType: String?
    //科目
    var subject: String = "02"
    var currentIndex: Int!
    //是否选择教材
    var change: Bool = false
    //选择教材信息
    var selectInfo = [Int: CourseModel]()
    
    var flag: Int = 1

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initHelper()
        
        initBaseLayout()
        layoutPageSubViews()
        
    }
    
    //MARK: - event response
    func chooseTextbook(sender: UIButton) {
        for i in 1..<7 {
            var button = UIButton()
            button = self.view.viewWithTag(i+100) as! UIButton
            if i == sender.tag - 100 {
                button.selected = true
            } else {
                button.selected = false
            }
        }
        infoPickerView.hidden = false
        currentIndex = sender.tag + 100
        switch sender.tag {
        case 101://数学
            subject = "02"
            break
        case 102://物理
            subject = "03"
            break
        case 103://化学
            subject = "04"
            break
        case 104://生物
            subject = "05"
            break
        case 105://英语
            subject = "01"
            break
        case 106://语文
            subject = "07"
            break
        default:
            break
        }
        //请求数据
        courseHelper?.courseManager?.loadData()
    }
    //点击view隐藏pickerview
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        infoPickerView.hidden = true
    }
    //保存版本信息
    func next(sender: UIButton) {
        if change == true {
            var version = "" as NSString
            for (key,item) in selectInfo {
                let v1 = String(key)
                let v2 = item.subType
                let v3 = item.id
                version =  version.stringByAppendingFormat("0%@:%@:%@##",v1,v2,v3)
            }
            if version.length > 2 {
                version = version.substringToIndex(version.length-2)
                let model = CourseModel()
                model.version = version as String
                courseHelper?.courseModel = model
                courseHelper?.saveVersionManager?.loadData()
            }
            
        }
    }
    
    //MARK: - private method
    func initBaseLayout() {
        //隐藏pickerview
        infoPickerView.hidden = true
        self.view.backgroundColor = UIColor(hexString: "#FBE8B6")
        initNavigationBar("navgationbar_register_btn_normal_iPhone", showLeft: true, showRight: false)
        self.view.addSubview(bgView)
        bgView.addSubview(chooseVersionImage)
        bgView.addSubview(mathButton)
        bgView.addSubview(mathLabel)
        bgView.addSubview(physicsButton)
        bgView.addSubview(physicsLabel)
        bgView.addSubview(chemicalButton)
        bgView.addSubview(chemicalLabel)
        bgView.addSubview(biologyButton)
        bgView.addSubview(biologyLabel)
        bgView.addSubview(englishButton)
        bgView.addSubview(englishLabel)
        bgView.addSubview(chineseButton)
        bgView.addSubview(chineseLabel)
        bgView.addSubview(nextButton)
        bgView.addSubview(infoPickerView)
        
    }
    func layoutPageSubViews() {
        bgView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.left.equalTo(self.view).offset(10)
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
        }
        chooseVersionImage.snp_makeConstraints { (make) in
            make.top.equalTo(bgView).offset(5)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(18)
        }
        mathButton.snp_makeConstraints { (make) in
            make.top.equalTo(chooseVersionImage.snp_bottom).offset(10)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(90)
        }
        mathLabel.snp_makeConstraints { (make) in
            make.top.equalTo(chooseVersionImage.snp_bottom).offset(10)
            make.left.equalTo(mathButton.snp_right).offset(15)
            make.right.equalTo(bgView).offset(-150)
            make.height.equalTo(30)
        }
        physicsButton.snp_makeConstraints { (make) in
            make.top.equalTo(mathButton.snp_bottom).offset(10)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(90)
        }
        physicsLabel.snp_makeConstraints { (make) in
            make.top.equalTo(mathLabel.snp_bottom).offset(10)
            make.left.equalTo(physicsButton.snp_right).offset(15)
            make.right.equalTo(bgView).offset(-150)
            make.height.equalTo(30)
        }
        chemicalButton.snp_makeConstraints { (make) in
            make.top.equalTo(physicsButton.snp_bottom).offset(10)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(90)
        }
        chemicalLabel.snp_makeConstraints { (make) in
            make.top.equalTo(physicsLabel.snp_bottom).offset(10)
            make.left.equalTo(chemicalButton.snp_right).offset(15)
            make.right.equalTo(bgView).offset(-150)
            make.height.equalTo(30)
        }
        biologyButton.snp_makeConstraints { (make) in
            if self.phase == "2" {
                make.top.equalTo(chemicalButton.snp_bottom).offset(0)
                make.height.equalTo(0)
            } else if self.phase == "3" {
                make.top.equalTo(chemicalButton.snp_bottom).offset(10)
                make.left.equalTo(bgView).offset(20)
                make.height.equalTo(30)
                make.width.equalTo(90)
            }
        }
        biologyLabel.snp_makeConstraints { (make) in
            if self.phase == "2" {
                make.top.equalTo(chemicalLabel.snp_bottom).offset(0)
                make.height.equalTo(0)
            } else if self.phase == "3" {
                make.top.equalTo(chemicalLabel.snp_bottom).offset(10)
                make.left.equalTo(biologyButton.snp_right).offset(15)
                make.right.equalTo(bgView).offset(-150)
                make.height.equalTo(30)
            }
        }
        englishButton.snp_makeConstraints { (make) in
            make.top.equalTo(biologyButton.snp_bottom).offset(10)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(90)
        }
        englishLabel.snp_makeConstraints { (make) in
            make.top.equalTo(biologyLabel.snp_bottom).offset(10)
            make.left.equalTo(englishButton.snp_right).offset(15)
            make.right.equalTo(bgView).offset(-150)
            make.height.equalTo(30)
        }
        chineseButton.snp_makeConstraints { (make) in
            make.top.equalTo(englishButton.snp_bottom).offset(10)
            make.left.equalTo(bgView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(90)
        }
        chineseLabel.snp_makeConstraints { (make) in
            make.top.equalTo(englishLabel.snp_bottom).offset(10)
            make.left.equalTo(chineseButton.snp_right).offset(15)
            make.right.equalTo(bgView).offset(-150)
            make.height.equalTo(30)
        }
        nextButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-50)
            make.width.equalTo(66)
            make.height.equalTo(30)
        }
        infoPickerView.snp_makeConstraints { (make) in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView.snp_left).offset(115)
            make.bottom.equalTo(bgView.snp_bottom).offset(-10)
            make.height.equalTo(70)
        }
    }
    //初始化helper
    func initHelper() {
        courseHelper = CourseViewControllerHelper()
        courseHelper?.callBackDelegate = self
        courseHelper?.courseViewController = self
        
        let phaseInfo = NSUserDefaults.standardUserDefaults()
        self.phase = phaseInfo.objectForKey("userPhase") as! String
        
        //请求数据
        courseHelper?.courseManager?.loadData()
    }
    // 获取教材数据，初始化默认教材
    func configBooks() {
        let arr = ["02","03","04","05","01","07"]
        if self.phase == "2" && dataSource != nil {
            for i in [0,1,2,4,5] {
                self.currentData = self.dataSource![arr[i]]
                if Array(self.currentData!.dictionary!.keys).count > 0 {
                    self.subType = Array(self.currentData!.dictionary!.keys).first
                }
                let lab = self.view.viewWithTag(201+i) as! UILabel
                lab.setTextContent(self.currentData![self.subType!][0]["book_name"].string!)
            }
        }
        
    }

    //MARK: - setter and getter
    var _bgView: UIView!
    var bgView: UIView {
        if _bgView == nil {
            _bgView = UIView()
            _bgView.backgroundColor = UIColor.clearColor()
        }
        return _bgView
    }
    var _chooseVersionImage: UIImageView!
    var chooseVersionImage: UIImageView {
        if _chooseVersionImage == nil {
            _chooseVersionImage = UIImageView()
            _chooseVersionImage.image = UIImage(named: "LoginAndRegister_chooseVersion_icon_normal_iPhone")
        }
        return _chooseVersionImage
    }
    var _mathButton: UIButton!
    var mathButton: UIButton {
        if _mathButton == nil {
            _mathButton = UIButton(type: .Custom)
            _mathButton.tag = 101
            _mathButton.setImage(UIImage(named: "Common_Math_btn_normal_iPhone"), forState: .Normal)
            _mathButton.setImage(UIImage(named: "Common_Math_btn_selected_iPhone"), forState: .Selected)
            _mathButton.addTarget(self, action: #selector(CourseViewController.chooseTextbook(_:)), forControlEvents: .TouchUpInside)
        }
        return _mathButton
    }
    var _mathLabel: UILabel!
    var mathLabel: UILabel {
        if _mathLabel == nil {
            _mathLabel = UILabel()
            _mathLabel.tag = 201
            _mathLabel.numberOfLines = 1
            _mathLabel.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
        }
        return _mathLabel
    }
    var _physicsButton: UIButton!
    var physicsButton: UIButton {
        if _physicsButton == nil {
            _physicsButton = UIButton(type: .Custom)
            _physicsButton.tag = 102
            _physicsButton.setImage(UIImage(named: "Common_Physics_btn_normal_iPhone"), forState: .Normal)
            _physicsButton.setImage(UIImage(named: "Common_Physics_btn_selected_iPhone"), forState: .Selected)
            _physicsButton.addTarget(self, action: #selector(CourseViewController.chooseTextbook(_:)), forControlEvents: .TouchUpInside)
        }
        return _physicsButton
    }
    var _physicsLabel: UILabel!
    var physicsLabel: UILabel {
        if _physicsLabel == nil {
            _physicsLabel = UILabel()
            _physicsLabel.tag = 202
            _physicsLabel.numberOfLines = 1
            _physicsLabel.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
        }
        return _physicsLabel
    }
    var _chemicalButton: UIButton!
    var chemicalButton:UIButton {
        if _chemicalButton == nil {
            _chemicalButton = UIButton(type: .Custom)
            _chemicalButton.tag = 103
            _chemicalButton.setImage(UIImage(named: "Common_Chemical_btn_normal_iPhone"), forState: .Normal)
            _chemicalButton.setImage(UIImage(named: "Common_Chemical_btn_selected_iPhone"), forState: .Selected)
            _chemicalButton.addTarget(self, action: #selector(CourseViewController.chooseTextbook(_:)), forControlEvents: .TouchUpInside)
        }
        return _chemicalButton
    }
    var _chemicalLabel: UILabel!
    var chemicalLabel: UILabel {
        if _chemicalLabel == nil {
            _chemicalLabel = UILabel()
            _chemicalLabel.tag = 203
            _chemicalLabel.numberOfLines = 1
            _chemicalLabel.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
        }
        return _chemicalLabel
    }
    var _biologyButton: UIButton!
    var biologyButton: UIButton {
        if _biologyButton == nil {
            _biologyButton = UIButton(type: .Custom)
            _biologyButton.tag = 104
            _biologyButton.setImage(UIImage(named: "Common_Biology_btn_normal_iPhone"), forState: .Normal)
            _biologyButton.setImage(UIImage(named: "Common_Biology_btn_selected_iPhone"), forState: .Selected)
            _biologyButton.addTarget(self, action: #selector(CourseViewController.chooseTextbook(_:)), forControlEvents: .TouchUpInside)
        }
        return _biologyButton
    }
    var _biologyLabel: UILabel!
    var biologyLabel: UILabel {
        if _biologyLabel == nil {
            _biologyLabel = UILabel()
            _biologyLabel.tag = 204
            _biologyLabel.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
        }
        return _biologyLabel
    }
    var _englishButton: UIButton!
    var englishButton: UIButton {
        if _englishButton == nil {
            _englishButton = UIButton(type: .Custom)
            _englishButton.tag = 105
            _englishButton.setImage(UIImage(named: "Common_English_btn_normal_iPhone"), forState: .Normal)
            _englishButton.setImage(UIImage(named: "Common_English_btn_selected_iPhone"), forState: .Selected)
            _englishButton.addTarget(self, action: #selector(CourseViewController.chooseTextbook(_:)), forControlEvents: .TouchUpInside)
        }
        return _englishButton
    }
    var _englishLabel: UILabel!
    var englishLabel: UILabel {
        if _englishLabel == nil {
            _englishLabel = UILabel()
            _englishLabel.tag = 205
            _englishLabel.numberOfLines = 1
            _englishLabel.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
        }
        return _englishLabel
    }
    var _chineseButton: UIButton!
    var chineseButton: UIButton {
        if _chineseButton == nil {
            _chineseButton = UIButton(type: .Custom)
            _chineseButton.tag = 106
            _chineseButton.setImage(UIImage(named: "Common_Chinese_btn_normal_iPhone"), forState: .Normal)
            _chineseButton.setImage(UIImage(named: "Common_Chinese_btn_selected_iPhone"), forState: .Selected)
            _chineseButton.addTarget(self, action: #selector(CourseViewController.chooseTextbook(_:)), forControlEvents: .TouchUpInside)
        }
        return _chineseButton
    }
    var _chineseLabel: UILabel!
    var chineseLabel: UILabel {
        if _chineseLabel == nil {
            _chineseLabel = UILabel()
            _chineseLabel.tag = 206
            _chineseLabel.numberOfLines = 1
            _chineseLabel.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
        }
        return _chineseLabel
    }
    var _nextButton: UIButton!
    var nextButton: UIButton {
        if _nextButton == nil {
            _nextButton = UIButton(type: .Custom)
            _nextButton.setBackgroundImage(UIImage(named: "LoginAndRegister_registerNext_icon_normal_iPhone"), forState: .Normal)
            _nextButton.setBackgroundImage(UIImage(named: "LoginAndRegister_registerNext_icon_selected_iPhone"), forState: .Highlighted)
            _nextButton.addTarget(self, action: #selector(CourseViewController.next(_:)), forControlEvents: .TouchUpInside)
        }
        return _nextButton
    }
    var _infoPickerView: UIPickerView!
    var infoPickerView: UIPickerView {
        if _infoPickerView == nil {
            _infoPickerView = UIPickerView()
            _infoPickerView.delegate = self
            _infoPickerView.dataSource = self
            _infoPickerView.backgroundColor = UIColor(hexString: "#FBE8B6")
        }
        return _infoPickerView
    }
}

extension CourseViewController: UIPickerViewDelegate,UIPickerViewDataSource,CourseViewCallBackDelegate {
    
    func callBackSuccess(manager: CSAPIBaseManager) {
        if manager.isKindOfClass(CourseViewManager) {
            dataSource = courseHelper?.courseModel?.dataSource
            subType = Array(dataSource![subject].dictionary!.keys)[0]
            if flag == 1 {
                configBooks()
                flag += 1
            }
            
            //刷新pickerview
            infoPickerView.reloadAllComponents()
        }
        if manager.isKindOfClass(SaveVersionManager) {
            let vc = RegistOKViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func callBackFailure() {
        
    }
    
    //设置选择框的行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if dataSource?.count > 0 {
            if component == 0 {
                return Array(dataSource![subject].dictionary!.keys).count
            } else if component == 1{
                if subType == nil {
                    return 0
                } else {
                    return dataSource![subject][subType!].count
                }
            }
        }
        return 0
    }
    //设置选择框的列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    //设置每一列的高度
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        switch component
        {
        case 0:return 100
        case 1:return 200
        default:return 0
        }
    }
    //设置选择框各选项的内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            if dataSource![subject].count > 0 {
                subType = Array(dataSource![subject].dictionary!.keys)[row]
                let str = Array(arrayLiteral: dataSource![subject][subType!])[0][0]["book_name"].string
                str?.componentsSeparatedByString(" ")[0]
                return str?.componentsSeparatedByString(" ")[0]
            }
        }else {
            if subType == nil {
                return ""
            }else {
                return dataSource![subType!][row]["book_name"].string
            }
        }
        return ""
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        if component == 0 {
            let lab = UILabel()
            lab.frame = CGRectMake(0, 0, 100, 20)
            lab.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
            lab.font = UIFont.systemFontOfSize(13)
            lab.textAlignment = NSTextAlignment.Center
            lab.numberOfLines = 1
            subType = Array(dataSource![subject].dictionary!.keys)[row]
            let str = Array(arrayLiteral: dataSource![subject][subType!])[0][0]["book_name"].string
            str?.componentsSeparatedByString(" ")[0]
            lab.text = str?.componentsSeparatedByString(" ")[0]

            return lab
        }else {
            if subType == nil {
                let lab = UILabel()
                lab.frame = CGRectMake(10, 0, 180, 40)
                lab.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
                lab.font = UIFont.systemFontOfSize(15)
                lab.textAlignment = NSTextAlignment.Center
                lab.numberOfLines = 0
                lab.text = ""
                return lab
            }else {
                let lab = UILabel()
                lab.frame = CGRectMake(150, 0, 350, 20)
                lab.textColor = UIColor(red: 159/255.0, green: -1/255.0, blue: -3/255.0, alpha: 1)
                lab.font = UIFont.systemFontOfSize(13)
                lab.textAlignment = NSTextAlignment.Center
                lab.numberOfLines = 0
                lab.text = Array(arrayLiteral: dataSource![subject][subType!])[0][row]["book_name"].string
                return lab
            }
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        change = true
        if component == 0 {
            if Array(dataSource![subject].dictionary!.keys).count > 0 {
                subType = Array(dataSource![subject].dictionary!.keys)[row]
                infoPickerView.reloadComponent(1)
            }
        }else {
            let data = dataSource![subject].dictionary
            let item  = CourseModel()
            item.subType = String(data![subType!]![row]["jiaocai_type"].stringValue)
            item.id = String(data![subType!]![row]["id"].stringValue)
            item.bookName = data![subType!]![row]["book_name"].stringValue
            selectInfo[currentIndex! - 201] = item
            let label = self.view.viewWithTag(currentIndex!) as! UILabel
            label.setTextContent(item.bookName!)
        }
    }
}
extension UILabel {
    func setTextContent(s:String)
    {
        self.text = s
        if s != "待选择"
        {
            self.textColor = UIColor(red: 87.0/255.0, green: 147.0/255.0, blue: 59.0/255.0, alpha: 1)
        }
    }
}

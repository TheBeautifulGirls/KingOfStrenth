//
//  PersonalInformationController.swift
//  KingOfStrenth
//
//  Created by 琳琳 on 16/9/30.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class PersonalInformationController: BaseViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    //城市数据源
    var cityArray:Array<(String,String)>?
    var sex:Int?
    // 选中省市的代号
    var selectedCityCode:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        
        initBaseLayout()
        layoutPageSubViews()
        cityArray = cityList()
        switch MENUINFO.sex() {
        case "":
            self.sex = 3
        case "男":
            self.sex = 1
        case "女":
            self.sex = 2
        default:
            break
        }
        if MENUINFO.city() == ""{
            cityBtn.setTitle("点击选择", forState: .Normal)
        }else{
            cityBtn.setTitle(cityName(MENUINFO.city()!), forState: .Normal)
        }
        
        if MENUINFO.stuBirth() == ""{
            birthdayBtn.setTitle("点击选择", forState: .Normal)
        }else{
            birthdayBtn.setTitle(MENUINFO.stuBirth(), forState: .Normal)
        }
        selectedCityCode = MENUINFO.city()
        

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        datePickViewBack.hidden = true
        cityPickViewBack.hidden = true
        self.view.endEditing(true)
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray!.count
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat{
        return 150
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray![row].0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let lab = UILabel()
        lab.frame = CGRectMake(0, 0, 150, 20)
        lab.font = UIFont.boldSystemFontOfSize(17)
        
        lab.textAlignment = NSTextAlignment.Center
        //lab.backgroundColor = UIColor(red: 251 / 255, green: 231 / 255, blue: 185 / 255, alpha: 1)
        lab.text = cityArray![row].0
        return lab
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityBtn.setTitle(cityArray![row].0, forState: .Normal)
    }
    
    //MARK: - private method
    func initBaseLayout(){
        self.view.userInteractionEnabled = true
        
        self.view.addSubview(personMessageView)
        self.view.addSubview(nickTxt)
        self.view.addSubview(nameTxt)
        self.view.addSubview(birthdayBtn)
        self.view.addSubview(manCheckBtn)
        self.view.addSubview(manLabel)
        self.view.addSubview(womanCheckBtn)
        self.view.addSubview(womanLabel)
        self.view.addSubview(sercetCheckBtn)
        self.view.addSubview(sercetLabel)
        self.view.addSubview(cityBtn)
        self.view.addSubview(schoolTxt)
        self.view.addSubview(gradeLabel)
        self.view.addSubview(saveBtn)

        self.view.addSubview(datePickViewBack)
        datePickViewBack.addSubview(datePicker)
        self.view.addSubview(cityPickViewBack)
        cityPickViewBack.addSubview(cityPickView)
        //cityPickViewBack.bringSubviewToFront(personMessageView)
        
        
    }
    
    func cityList() -> Array<(String,String)> {
        if let path = NSBundle.mainBundle().pathForResource("CityList", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) {
                var result = [(String,String)]()
                for item in array {
                    let provience = item as! NSDictionary
                    result.append((provience["name"] as! String,provience["id"] as! String))
                }
                return result
            }
        }
        return [(String,String)]()
    }
    func cityName(id:String)->String {
        if let path = NSBundle.mainBundle().pathForResource("CityList", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) {
                
                for item in array {
                    let provience = item as! NSDictionary
                    let theID = provience["id"] as! String
                    if theID == id {
                        return provience["name"] as! String
                    }
                }
                return ""
            }
        }
        return ""
    }
    
    func layoutPageSubViews(){
        personMessageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top).offset(15/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(40/736*WIDTH)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(260/414*HEIGHT)
        }
        
        nickTxt.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top)
                .offset(7.5/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.right.equalTo(self.view.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
            
        }
        
        nameTxt.snp_makeConstraints { (make) in
            make.top.equalTo(nickTxt.snp_bottom)
                .offset(10/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.right.equalTo(self.view.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
            
        }
        
        birthdayBtn.snp_makeConstraints { (make) in
            make.top.equalTo(nameTxt.snp_bottom)
                .offset(10/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(135/736*WIDTH)
            make.width.equalTo(100/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        manCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        manLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(manCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        womanCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(manLabel.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        womanLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(womanCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        sercetCheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(womanLabel.snp_right).offset(40/736*WIDTH)
            make.width.equalTo(21.5/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        sercetLabel.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(16/414*HEIGHT)
            make.left.equalTo(sercetCheckBtn.snp_right).offset(2/736*WIDTH)
            make.width.equalTo(60/736*WIDTH)
            make.height.equalTo(22/414*HEIGHT)
        }
        
        cityBtn.snp_makeConstraints { (make) in
            make.top.equalTo(manCheckBtn.snp_bottom).offset(14/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(135/736*WIDTH)
            make.width.equalTo(100/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        schoolTxt.snp_makeConstraints { (make) in
            make.top.equalTo(cityBtn.snp_bottom).offset(12/414*HEIGHT)
            make.left.equalTo(self.view.snp_left).offset(140/736*WIDTH)
            make.right.equalTo(self.view.snp_right).offset(-220/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        gradeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(schoolTxt.snp_bottom).offset(6/414*HEIGHT)
            //make.left.equalTo(self.view.snp_left).offset(280/736*WIDTH)
            make.left.equalTo(schoolTxt)
            make.width.equalTo(80/736*WIDTH)
            make.height.equalTo(31/414*HEIGHT)
        }
        
        saveBtn.snp_makeConstraints { (make) in
            make.top.equalTo(gradeLabel.snp_bottom).offset(10/414*HEIGHT)
            make.left.equalTo(gradeLabel.snp_right).offset(45/736*WIDTH)
            make.width.equalTo(100/736*WIDTH)
            make.height.equalTo(30/414*HEIGHT)
        }
        
        cityPickViewBack.snp_makeConstraints { (make) in
           make.top.equalTo(cityBtn.snp_bottom).offset(0)
           make.left.equalTo(personMessageView.snp_left).offset(18)
           make.width.equalTo(461/736*WIDTH)
           make.height.equalTo(200/414*HEIGHT)
       }
        
        cityPickView.snp_makeConstraints { (make) in
            make.left.equalTo(cityPickViewBack)
            make.top.equalTo(cityPickViewBack)
            make.width.equalTo(cityPickViewBack)
            make.height.equalTo(cityPickViewBack)
        }
        
        datePickViewBack.snp_makeConstraints { (make) in
            make.top.equalTo(birthdayBtn.snp_bottom).offset(0)
            make.left.equalTo(personMessageView.snp_left).offset(18)
            make.width.equalTo(461/736*WIDTH)
            make.height.equalTo(250/414*HEIGHT)
            
        }
        
        datePicker.snp_makeConstraints { (make) in
            make.left.equalTo(datePickViewBack)
            make.top.equalTo(datePickViewBack)
            make.width.equalTo(datePickViewBack)
            make.height.equalTo(datePickViewBack)
        }

  
    }
    
    //MARK: - setting and getting
    var _personMessageView:UIImageView!
    var personMessageView:UIImageView {
        if _personMessageView == nil {
            _personMessageView = UIImageView()
            _personMessageView.userInteractionEnabled = true
            _personMessageView.image = UIImage(named: "setting_infotext_icon_normal_iphone")
        }
        return _personMessageView
    }
    
    var _nickTxt:UITextField!
    var nickTxt:UITextField {
        if _nickTxt == nil {
            _nickTxt = InputBoxView(showLeftView: false, showLeftBank: true)
            _nickTxt.text = MENUINFO.stuName()
            
        }
        return _nickTxt
    }
    
    var _nameTxt:UITextField!
    var nameTxt:UITextField {
        if _nameTxt == nil {
            _nameTxt = InputBoxView(showLeftView: false, showLeftBank: true)
            _nameTxt.text = MENUINFO.stuName()
            
        }
        return _nameTxt
    }
    
    var _birthdayBtn:UIButton!
    var birthdayBtn:UIButton {
        if _birthdayBtn == nil {
            _birthdayBtn = UIButton()
            //_birthdayBtn.setTitle("点击选择", forState: .Normal)
            _birthdayBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
            _birthdayBtn.setTitleColor(UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1), forState: .Normal)
            _birthdayBtn.addTarget(self, action: #selector(PersonalInformationController.selectBirthdayDate(_:)), forControlEvents: .TouchUpInside)
        }
        return _birthdayBtn
    }
    
    var _manCheckBtn:UIButton!
    var manCheckBtn:UIButton {
        if _manCheckBtn == nil {
            _manCheckBtn = UIButton()
            _manCheckBtn.tag = 1
            _manCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _manCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _manCheckBtn.addTarget(self, action: #selector(PersonalInformationController.checkSexBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _manCheckBtn
    }
    
    var _manLabel:UILabel!
    var manLabel:UILabel {
        if _manLabel == nil {
            _manLabel = UILabel()
            _manLabel.text = "男"
            _manLabel.textColor = UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
            _manLabel.font = UIFont.boldSystemFontOfSize(15)
        }
        return _manLabel
    }
    
    var _womanCheckBtn:UIButton!
    var womanCheckBtn:UIButton {
        if _womanCheckBtn == nil {
            _womanCheckBtn = UIButton()
            _womanCheckBtn.tag = 2
            _womanCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _womanCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            

            _womanCheckBtn.addTarget(self, action: #selector(PersonalInformationController.checkSexBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _womanCheckBtn
    }
    
    var _womanLabel:UILabel!
    var womanLabel:UILabel {
        if _womanLabel == nil {
            _womanLabel = UILabel()
            _womanLabel.text = "女"
            _womanLabel.textColor = UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
            _womanLabel.font = UIFont.boldSystemFontOfSize(15)
        }
        return _womanLabel
    }
    
    var _sercetCheckBtn:UIButton!
    var sercetCheckBtn:UIButton {
        if _sercetCheckBtn == nil {
            _sercetCheckBtn = UIButton()
            _sercetCheckBtn.selected = true
            _sercetCheckBtn.tag = 3
            _sercetCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_normal_iPhone"), forState: .Normal)
            _sercetCheckBtn.setBackgroundImage(UIImage(named: "Common_check_btn_selected_iPhone"), forState: .Selected)
            _sercetCheckBtn.addTarget(self, action: #selector(PersonalInformationController.checkSexBtn(_:)), forControlEvents: .TouchUpInside)
        }
        return _sercetCheckBtn
    }
    
    var _sercetLabel:UILabel!
    var sercetLabel:UILabel {
        if _sercetLabel == nil {
            _sercetLabel = UILabel()
            _sercetLabel.text = "保密"
            _sercetLabel.textColor = UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
            _sercetLabel.font = UIFont.boldSystemFontOfSize(15)
        }
        return _sercetLabel
    }
    
    var _cityBtn:UIButton!
    var cityBtn:UIButton {
        if _cityBtn == nil {
            _cityBtn = UIButton()
            _cityBtn.setTitle("点我选择", forState: .Normal)
            _cityBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
            _cityBtn.setTitleColor(UIColor.init(colorLiteralRed: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1), forState: .Normal)
            _cityBtn.addTarget(self, action: #selector(PersonalInformationController.selectedCity(_:)), forControlEvents: .TouchUpInside)

            
            
        }
        return _cityBtn
    }
    
    var _schoolTxt:UITextField!
    var schoolTxt:UITextField {
        if _schoolTxt == nil {
            _schoolTxt = InputBoxView(showLeftView: false, showLeftBank: true)
            _schoolTxt.text = MENUINFO.stuSch()
        }
        return _schoolTxt
    }
    
    var _gradeLabel:UILabel!
    var gradeLabel:UILabel {
        if _gradeLabel == nil {
            _gradeLabel = UILabel()
            _gradeLabel.text = MENUINFO.grade() == "2" ? "初中" : "高中"
            _gradeLabel.font = UIFont.systemFontOfSize(15)
            _gradeLabel.textColor = UIColor.init(red: 144/255.0, green: 14/255.0, blue: 18/255.0, alpha: 1)
        }
        return _gradeLabel
    }
    
    var _saveBtn:UIButton!
    var saveBtn:UIButton {
        if _saveBtn == nil {
            _saveBtn = UIButton()
            _saveBtn.setBackgroundImage(UIImage(named: "Setting_save_btn_normal_iPhone"), forState: .Normal)
            _saveBtn.setBackgroundImage(UIImage(named: "Setting_save_btn_selected_iPhone"), forState:.Highlighted)
            _saveBtn.addTarget(self, action: #selector(PersonalInformationController.saveBtn(_:)), forControlEvents: .TouchUpInside)
            
        }
        return _saveBtn
    }
    
    var _cityPickView:UIPickerView!
    var cityPickView:UIPickerView{
        if _cityPickView == nil{
            _cityPickView = UIPickerView()
            _cityPickView.userInteractionEnabled = true
            _cityPickView.delegate = self
            _cityPickView.dataSource = self
            
        }
        return _cityPickView
    }
    
    var _datePicker:UIDatePicker!
    var datePicker:UIDatePicker{
        if _datePicker == nil{
            _datePicker = UIDatePicker()
            _datePicker.datePickerMode = .Date
            _datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
            _datePicker.addTarget(self, action: #selector(PersonalInformationController.selectedBirthday(_:)), forControlEvents: .ValueChanged)
            
        }
        return _datePicker
    }
    
    var _cityPickViewBack:UIView!
    var cityPickViewBack:UIView{
        if _cityPickViewBack == nil{
            _cityPickViewBack = UIView()
            _cityPickViewBack.backgroundColor = UIColor(red: 253 / 255, green: 236 / 255, blue: 195 / 255, alpha: 1)
            _cityPickViewBack.userInteractionEnabled = true
            _cityPickViewBack.hidden = true
        }
        return _cityPickViewBack
    }
    
    var _datePickViewBack:UIView!
    var datePickViewBack:UIView{
        if _datePickViewBack == nil{
            _datePickViewBack = UIView()
            _datePickViewBack.backgroundColor = UIColor(red: 253 / 255, green: 236 / 255, blue: 195 / 255, alpha: 1)
            _datePickViewBack.hidden = true
            _datePickViewBack.userInteractionEnabled = true
        }
        return _datePickViewBack
    }
    

    
    //MARK: - event response
    func saveBtn(sender:AnyObject) {
        if NSString(string:nickTxt.text!).stringByReplacingOccurrencesOfString(" ", withString: "") != nickTxt.text{
            YAlertViewController.showAlertController(self, title: "昵称不能包含空格", message: "")
            return
        }
        
        if NSString(string:nameTxt.text!).stringByReplacingOccurrencesOfString(" ", withString: "") != nameTxt.text{
            YAlertViewController.showAlertController(self, title: "真实姓名不能包含空格", message: "")
           return
    }
        
        if schoolTxt.text == ""{
            YAlertViewController.showAlertController(self, title: "请填写学校", message: "")
            return
        }
        
        if nickTxt.text == ""{
            YAlertViewController.showAlertController(self, title: "请填写昵称", message: "")
            return
        }
        
        if nameTxt.text == ""{
            YAlertViewController.showAlertController(self, title: "请填写姓名", message: "")
            return
        }
        
        if NSString(string: nickTxt.text!).length > 8{
            YAlertViewController.showAlertController(self, title: "昵称不能超过8位", message: "")
            return
        }
        
        if NSString(string:nameTxt.text!).length > 30{
            YAlertViewController.showAlertController(self, title: "真实姓名不能超过30位", message: "")
            return
        }
        
        if self.selectedCityCode == ""{
            YAlertViewController.showAlertController(self, title: "请选择省份", message: "")
            return
        }
        
        if birthdayBtn.titleLabel?.text == "" || birthdayBtn.titleLabel?.text == "0000-00-00" || birthdayBtn.titleLabel?.text == "点击选择"{
            YAlertViewController.showAlertController(self, title: "请选择生日", message: "")
            return
        }
}
    
    func checkSexBtn(sender:UIButton) {
        //选中状态图片的设置
        for i in [1,2,3]{
            let btn = self.view.viewWithTag(i) as! UIButton
            btn.selected = false
        }
        sender.selected = true

    }
    
    func selectedBirthday(pick:UIDatePicker){
        let f = NSDateFormatter()
        f.dateFormat = "YYYY-MM-dd"
        birthdayBtn.setTitle(f.stringFromDate(pick.date), forState: .Normal)
        
        
    }
    
    func selectBirthdayDate(sender:UIButton){
        cityPickViewBack.hidden = true
        datePickViewBack.hidden = false
        let f = NSDateFormatter()
        f.dateFormat = "YYYY-MM-dd"
        datePicker.date = f.dateFromString("1995-01-01")!
        datePicker.minimumDate = f.dateFromString("1995-01-01")!
        datePicker.maximumDate = NSDate()
    }
    
    func selectedCity(btn:UIButton){
        cityPickViewBack.hidden = false
        datePickViewBack.hidden = true
    }
    
}

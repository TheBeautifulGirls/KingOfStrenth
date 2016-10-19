//
//  gzjCell.swift
//  KingOfStrenth
//
//  Created by quhaiou on 16/10/12.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class gzjCell: UITableViewCell {

    // MARK: - life cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initBaseLayout()
        layoutPageSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private method
    func initBaseLayout() {
        self.contentView.addSubview(leftImageView)
        self.contentView.addSubview(titleLabel)
     
    }
    
    func layoutPageSubViews() {
        leftImageView.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp_left).offset(20/736*WIDTH)
            make.top.equalTo(self.contentView.snp_top).offset(12/414*HEIGHT)
            make.width.equalTo(24/736*WIDTH)
            make.height.equalTo(24/414*HEIGHT)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp_right).offset(10/736*WIDTH)
            make.top.equalTo(self.contentView.snp_top).offset(6/414*HEIGHT)
            make.width.equalTo(400/736*WIDTH)
            make.height.equalTo(35/414*HEIGHT)
        }
    }
    
    //MARK: - setters and getters
    var _leftImageView: UIImageView!
    var leftImageView: UIImageView {
        if _leftImageView == nil {
            _leftImageView = UIImageView()
            _leftImageView.image = UIImage(named: "ImperialCollege_ChinesePlay_icon_normol_iPhone")
        }
        return _leftImageView
    }
    
    var _titleLabel: UILabel!
    var titleLabel: UILabel {
        if _titleLabel == nil {
            _titleLabel = UILabel()
            _titleLabel.font = UIFont.systemFontOfSize(16)
            _titleLabel.textColor = UIColor.init(colorLiteralRed: 174/255.0, green: 13/255.0, blue: 11/255.0, alpha: 1)
        }
        return _titleLabel
    }
}

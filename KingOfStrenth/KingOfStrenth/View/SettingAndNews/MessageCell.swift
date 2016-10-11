//
//  MessageCell.swift
//  KingOfStrenth
//
//  Created by cll12_12 on 16/9/29.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // MARK: - life cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initBaseLayout()
        layoutPageSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - private method
    func initBaseLayout() {
        self.contentView.addSubview(mesImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(dateLabel)
    }
    
    func layoutPageSubViews() {
        mesImageView.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(35)
            make.height.equalTo(20)
        }
        dateLabel.snp_makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-20)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(12)
            make.width.equalTo(140)
        }
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(mesImageView.snp_right).offset(10)
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(dateLabel.snp_left).offset(-10)
            make.height.equalTo(13)
        }
    }
    
    func configUIWithModel(model: DetailMessageModel, indexPath: NSIndexPath) {
        
    }
    
    // MARK: - setters and getters
    var _mesImageView: UIImageView!
    var mesImageView: UIImageView {
        if _mesImageView == nil {
            _mesImageView = UIImageView()
            
        }
        return _mesImageView
    }
    
    var _titleLabel: UILabel!
    var titleLabel: UILabel {
        if _titleLabel == nil {
            _titleLabel = UILabel()
            _titleLabel.font = UIFont.systemFontOfSize(13)
        }
        return _titleLabel
    }
    
    var _dateLabel: UILabel!
    var dateLabel: UILabel {
        if _dateLabel == nil {
            _dateLabel = UILabel()
            _dateLabel.font = UIFont.systemFontOfSize(12)
            _dateLabel.textColor = UIColor.lightGrayColor()
        }
        return _dateLabel
    }
    
}
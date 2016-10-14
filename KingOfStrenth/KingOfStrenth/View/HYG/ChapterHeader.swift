//
//  ChapterHeader.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import UIKit

class ChapterHeader: UICollectionReusableView {
    var bgImage: UIImageView!
    var chapterLabel: UILabel!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
    }
    
    func initConfig() {
        
        //背景图片
        bgImage = UIImageView(image: UIImage(named: "Common_knowledgecell_btn_normal_iPhone"))
        bgImage.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
        self.addSubview(bgImage)
        
        //章
        chapterLabel = UILabel(frame: CGRectMake(0,5,self.bounds.size.width,20))
        chapterLabel.numberOfLines = 1
        chapterLabel.textAlignment = .Center
        chapterLabel.textColor = UIColor(red: 102, green: 55, blue: 0, alpha: 1)
        self.addSubview(chapterLabel)
        
        //节
        titleLabel = UILabel(frame: CGRectMake(0,5,self.bounds.size.width,20))
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor(red: 102, green: 55, blue: 0, alpha: 1)
        self.addSubview(titleLabel)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
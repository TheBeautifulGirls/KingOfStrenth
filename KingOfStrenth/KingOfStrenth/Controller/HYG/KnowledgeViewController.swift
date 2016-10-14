//
//  KnowledgeViewController.swift
//  KingOfStrenth
//
//  Created by fengshuyan on 16/10/13.
//  Copyright © 2016年 陈玲玲. All rights reserved.
//

import Foundation
import UIKit

class KnowledgeViewController: HuiHospitalViewController {
    
    
    //MARK: --  life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseLayoutNew()
        layoutPageSubViewsNew()
    }
    
    //override
    override func selectCourse(sender: UIButton) {
        backImageView.image = UIImage(named: "HuiHospital_background_iPhone")
        for i in 1...6 {
            let button = self.view.viewWithTag(i + 100) as! UIButton
            if sender.tag == i + 100 {
                button.selected = true
            } else {
                button.selected = false
            }
        }

    }
    
    //MARK: -- private method
    func initBaseLayoutNew(){
        initNavigationBar("HuiHospital_navbarknowledge_title_iPhone", showLeft: true, showRight: false)
        knowledgeBtn.removeFromSuperview()
        testCenterBtn.removeFromSuperview()
        backImageView.image = UIImage(named: "HuiHospital_background_iPhone")
        backImageView.addSubview(knowledgeCollectionView)
    }
    func layoutPageSubViewsNew() {
        knowledgeCollectionView.snp_makeConstraints { (make) in
            make.left.equalTo(self.view).offset(150/736*SCREEN_WIDTH)
            make.top.equalTo(self.view).offset(54)
            make.height.equalTo(SCREEN_HEIGHT - 54)
            make.width.equalTo(365/736*SCREEN_WIDTH)
        }
    }
    
    //MARK: -- setter getter
    var _knowledgeCollectionView: UICollectionView!
    var knowledgeCollectionView: UICollectionView {
        if _knowledgeCollectionView == nil {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 170/736*SCREEN_WIDTH, height: 40/414*SCREEN_HEIGHT)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            _knowledgeCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
            _knowledgeCollectionView.backgroundColor = UIColor.clearColor()
            _knowledgeCollectionView.allowsMultipleSelection = true
            _knowledgeCollectionView.delegate = self
            _knowledgeCollectionView.dataSource = self
            
            //注册
            _knowledgeCollectionView.registerClass(ChapterCell.self, forCellWithReuseIdentifier: "ChapterCell")
            _knowledgeCollectionView.registerClass(ChapterHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ChapterHeader")
            
            return _knowledgeCollectionView
            
        }
        return _knowledgeCollectionView
    }
    
}

extension KnowledgeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ChapterCell", forIndexPath: indexPath)
        cell.backgroundView = UIImageView(image: UIImage(named: "Common_knowledgecell_btn_normal_iPhone"))
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 2, 5, 2)
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "ChapterHeader", forIndexPath: indexPath) as! ChapterHeader
        
        
        return headerView
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(365/736*SCREEN_WIDTH, 55/414*SCREEN_HEIGHT)
    }
}
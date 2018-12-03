//
//  ViewController.swift
//  YPWaterFallLayout
//
//  Created by 赖永鹏 on 2018/12/3.
//  Copyright © 2018年 LYP. All rights reserved.
//

import UIKit

private let kCellID = "kCellID"
class ViewController: UIViewController {

    fileprivate lazy var itemCount = 30
    fileprivate lazy var collectionView : UICollectionView = {
        
        let layout = YPWaterFallLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.dataSource = self
        
       let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.addSubview(collectionView)
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellID, for: indexPath)
        cell.backgroundColor = UIColor.randomColor
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= collectionView.contentSize.height - scrollView.bounds.height {
            itemCount += 30
            collectionView.reloadData()
        }
    }
}
extension ViewController : YPWaterFallLayoutDataSource {
    
    func waterFallLayout(_ layout: YPWaterFallLayout) -> Int {
      return 4
    }
    
    func waterFallLayout(_ layout: YPWaterFallLayout, indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(arc4random_uniform(180)+120)
//        return indexPath.item % 2 == 0 ? 250 : 180
    }
    
}


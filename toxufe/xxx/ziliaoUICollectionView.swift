//
//  ziliaoUICollectionView.swift
//  xxx
//
//  Created by txf on 15/5/28.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class ziliaoUICollectionView: UICollectionView,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
        self.delegate   = self
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        var fWidth = (self.frame.size.width/4)
        return CGSize(width: fWidth, height: 39)
        
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
    //        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    //
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
        return 0.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
        return 0.0
    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
    //        return CGSize(width: 30, height: 30)
    //    }
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //        return CGSize(width: 30, height: 30)
    //    }
    
    //自定义格子内容
    var geTxt = ["动态","订阅","通知","抵用金"]
    var geTxt1 = ["1","2","3","1000元"]
    //返回几个格子
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return geTxt.count
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Ccell", forIndexPath: indexPath) as! UICollectionViewCell
        //cell.backgroundColor = UIColor.yellowColor()

        
        
        var UILabel1 = cell.viewWithTag(1) as! UILabel
        var UILabel2 = cell.viewWithTag(2) as! UILabel
        let titlerFont  = returnFont(15.0)
        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        let titlerFont1  = returnFont(13.0)
        let titlerColor1 = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
        UILabel1.text = geTxt[indexPath.row]
        UILabel1.font = titlerFont
        UILabel1.textColor  = titlerColor
        UILabel2.text = geTxt1[indexPath.row]
        UILabel2.font = titlerFont1
        UILabel2.textColor  = titlerColor1

        //右侧线条
        let labelx = UILabel (frame: CGRect (x: (cell.frame.size.width-2), y: (6), width: 0, height: 0))
        let lbg   = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        labelx.frame.size.width = (1)
        labelx.frame.size.height = (35)
        labelx.backgroundColor  = lbg
        if indexPath.row != 3 {
            cell.addSubview(labelx)
        }
        return cell
    }
    
    
    //collectview点击事件
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        //println("我是collect第\(indexPath.row)行")
    }
    
    
    
    

}

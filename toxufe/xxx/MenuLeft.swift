//
//  MenuLeft.swift
//  xxx
//
//  Created by txf on 15/6/26.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class MenuLeft: UICollectionView,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    var retGeZiNum = 6
    var identifier = "cellName"
    var deviceW:Double?

    @IBOutlet weak var menuList: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        self.delegate = self
    
        //加载函数
        setupViews()
        //填充模式
        //self.scrollEnabled = true
        self.backgroundColor = UIColor.whiteColor()
    }
    
    func getDeviceW()->CGFloat{
        var deviceWW = UIScreen.mainScreen().applicationFrame.width
        println(deviceWW)
        return 10
    }
    
    //返回几个格子
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return retGeZiNum
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! MenuViewCell
        var index = indexPath.row
        var data = index
        var label1 = cell.viewWithTag(1) as! UILabel
        label1.text = "11245"
        
        
        cell.backgroundColor = UIColor.redColor()

        return cell
    
    }
    
    
    
    func setupViews(){
        //自定义单元格
        var nib = UINib(nibName:"MenuViewCell", bundle: nil)
        //结合单元格
        self.registerNib(nib, forCellWithReuseIdentifier: identifier)

    }
    //点击事件
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        println(indexPath.row)
    }
    
    
    
    //每个集合格子的宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            var viewW = self.frame.size.width
            var viewh = self.frame.size.height
            return CGSize(width: 60, height: 60)
            
    }
    
    //外边距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        //var widthFather = view.frame.width
        //var cellWidth   = (widthFather-((self.CellWidth)*5))/8 as CGFloat
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    //上下的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
        //返回真实的上下边距
        var w = getDeviceW()
        
        return w
    }
    //左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
        //var widthFather = view.frame.width
        //var cellWidth   = (widthFather-((self.CellWidth)*5))/8 as CGFloat
        return 10
    }
    

    

    func handlePanGesture (sender:AnyObject){
        //var uiview = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        //UIScrollView.scrollRectToVisible(uiview)

    }

    @IBAction func jiankangTitle(sender: UIButton) {
        var title = sender.currentTitle
        if let t = title {
            println(t)
        }
        
    }
}

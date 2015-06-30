//
//  BottomMenu.swift
//  xxx
//
//  Created by txf on 15/6/26.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class BottomMenu: UIScrollView {
    
    let pageControllHeight: CGFloat = 20
    var pageCount = 2
    var pageCon: UIPageControl!
    var carouselAutoplay = true
    var carouselLoopTimer: NSTimer!
    var carouselPeriodTime = 2.0
    
    func getHei() {
        let h = self.frame.size.height
        
        println(self.superview!.bounds.height)
        
        let junH = (h-64)/3
        var v1 = 1.4*junH - 10
        var v2 = 1.8*junH - 27
        //var v3 =
        
        //println(v1)
        //println(v2)
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        
        
        //getHei()
        
        
        //委托事件
        //self.delegate = self
        //setTranslatesAutoresizingMaskIntoConstraints
        //self.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //self.userInteractionEnabled = true

        //获取屏幕的宽度
        var w = UIScreen.mainScreen().applicationFrame.size.width
        var hh = UIScreen.mainScreen().applicationFrame.size.height
        
        
        
        var w2 = self.frame.width
        var h = (hh - 64 - 110)/2
        
        
        //println(h1)
        //重置高度
        self.frame.size.height  = h
        self.contentSize = CGSize(width: w*2, height:h)
        
        //println(self)
        //self.delegate = self
        self.pagingEnabled = true
        self.scrollEnabled = true
        
        //xib文件调用控件 左侧页面的按钮
        var MenuLeft =  NSBundle.mainBundle().loadNibNamed("MenuLeft" ,owner: self, options: nil) as Array
        var v1 = MenuLeft[0] as! UICollectionView
        //重置尺寸
        //v1.setTranslatesAutoresizingMaskIntoConstraints(false)
        v1.frame = CGRectMake(0, 0, w, h)
        //println(w)
        //v1.frame = CGRect(x: 0, y: 0, width: w, height: 50)
        //v1.autoresizingMask = UIViewAutoresizing.FlexibleHeight

        //填充模式
        //self.contentMode = UIViewContentMode.ScaleAspectFit
        //v1.userInteractionEnabled = false
        //v1.userInteractionEnabled = false
        self.addSubview(v1)
        

        
        
        
        //println(self)
        
        
        //println(w)

        var MenuRight =  NSBundle.mainBundle().loadNibNamed("MenuLeft" ,owner: self, options: nil) as Array
        var v2 = MenuRight[0] as! UICollectionView
        //v2.setTranslatesAutoresizingMaskIntoConstraints(false)
        //v2.autoresizingMask = UIViewAutoresizing.FlexibleHeight


        //穿透事件
        //v2.userInteractionEnabled = false
        //重置尺寸
        //println(w)
        v2.frame = CGRectMake(1*w, 0, w, h)
        self.addSubview(v2)
        
        
  
    }
    
    func handlePanGesture(sender:AnyObject){
        //获取屏幕的宽度
        
//        var v1 = self.viewWithTag(11) as UIView!
//        v1.backgroundColor = UIColor.redColor()
//        v1.userInteractionEnabled = false
//        
//        var v2 = self.viewWithTag(22) as UIView!
//        v2.backgroundColor = UIColor.yellowColor()
//        v2.userInteractionEnabled = false
        

    }
    
    
    
    
    

    

    
    func setPageControl() {
        var w = UIScreen.mainScreen().applicationFrame.size.width
        var h = self.frame.size.height
        pageCon = UIPageControl(frame: CGRect(x: 0, y: h - pageControllHeight, width: w, height: pageControllHeight))
        pageCon.numberOfPages = pageCount
        
        //居中
        pageCon.center = CGPointMake(self.center.x, pageCon.center.y)
        self.superview?.addSubview(pageCon)
        pageCon.pageIndicatorTintColor = returnRgb(204)


    }

}

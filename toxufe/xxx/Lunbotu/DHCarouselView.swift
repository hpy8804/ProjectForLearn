//
//  DHCarouselView.swift
//  DHImageCarousel
//
//  Created by 胡大函 on 14/11/11.
//  Copyright (c) 2014年 HuDahan_payMoreGainMore. All rights reserved.
//

import UIKit

protocol DHCarouselViewDelegate {
  func carouselView(carouselView: DHCarouselView, didSelectedPageAtIndex index: NSInteger);
}

class DHCarouselView: UIView {

  var carouselScrollView: UIScrollView!
  var carouselPageControl: UIPageControl!
  var carouselLoopTimer: NSTimer!
  var carouselDataArray = [String]()
  var carouselPeriodTime = 2.0
  var carouselAutoplay = true
  var delegate: DHCarouselViewDelegate!
  
  let pageControllHeight: CGFloat = 20
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setCarouselScrollView()
    setPageControl()
  }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setCarouselScrollView() {
    carouselScrollView = UIScrollView(frame: CGRect(origin: CGPointZero, size: self.frame.size))
    carouselScrollView.pagingEnabled = true
    carouselScrollView.delegate = self
    carouselScrollView.showsHorizontalScrollIndicator = false
    self.addSubview(carouselScrollView)
  }
  
  func setPageControl() {
    carouselPageControl = UIPageControl(frame: CGRect(x: 0, y: carouselScrollView.frame.size.height - pageControllHeight, width: carouselScrollView.frame.size.width, height: pageControllHeight))
    carouselPageControl.numberOfPages = 1
    self.addSubview(carouselPageControl)
    
    
    //carouselPageControl.backgroundColor = UIColor.redColor()
    //carouselPageControl.contentMode = UIViewContentMode.TopRight
    carouselPageControl.center = CGPointMake(self.center.x+(self.center.x/1.3), carouselPageControl.center.y)
    //carouselPageControl.center = CGPointMake(carouselScrollView.frame.size.width, 0)
    carouselPageControl.pageIndicatorTintColor = returnRgb(204)

    //carouselPageControl.center
  }
  
}

extension DHCarouselView{
  func loadCarouselDataThenStart () {
    if carouselDataArray.count <= 0 {
      
    }
    
    carouselScrollView.contentSize = CGSize(width: carouselScrollView.frame.size.width * CGFloat(carouselDataArray.count + 2), height: carouselScrollView.frame.size.height)
    carouselPageControl.numberOfPages = carouselDataArray.count
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //循环默认图片
    for i in 0...carouselDataArray.count - 1 {
        
        let carouselImgName = carouselDataArray[i]
        var image_local = UIImage(named: carouselImgName)
        var carouselBtn = UIButton(frame: CGRect(x: carouselScrollView.frame.size.width * CGFloat(i+1), y: 0, width: carouselScrollView.frame.size.width, height: carouselScrollView.frame.size.height))
        var imageView = getImagePic(carouselImgName)
        carouselBtn.addSubview(imageView)
        
        carouselBtn.contentMode = UIViewContentMode.ScaleToFill
        carouselBtn.tag = i
        carouselBtn.addTarget(self, action: Selector("carouselBtnTapped:"), forControlEvents: UIControlEvents.TouchUpInside)

        carouselBtn.addSubview(imageView)
        carouselScrollView.addSubview(carouselBtn)
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //上一张图片翻页
    var uiImageViewLuBoTu = UIImageView(frame: CGRect(x: 0, y: 0, width: carouselScrollView.frame.size.width, height: carouselScrollView.frame.size.height))
    let lastCarouselImg = carouselDataArray[carouselDataArray.count - 1]
    var imageView = getImagePic(lastCarouselImg)
    let lastCarouselBtn = UIButton(frame: CGRect(origin: CGPointZero, size: carouselScrollView.frame.size))
    lastCarouselBtn.addSubview(uiImageViewLuBoTu)
    lastCarouselBtn.contentMode = UIViewContentMode.ScaleToFill
    carouselScrollView.addSubview(lastCarouselBtn)
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //下一张图片翻页
    let firstCarouselImg = carouselDataArray[0]
    var imageViewNext = getImagePic(firstCarouselImg)

    let firstCarouselBtn = UIButton(frame: CGRect(origin: CGPoint(x: CGFloat(carouselDataArray.count + 1) * carouselScrollView.frame.size.width, y: 0), size: carouselScrollView.frame.size))
    firstCarouselBtn.addSubview(imageViewNext)
    firstCarouselBtn.contentMode = UIViewContentMode.ScaleToFill
    carouselScrollView.addSubview(firstCarouselBtn)
    
    carouselScrollView.setContentOffset(CGPoint(x: carouselScrollView.frame.size.width, y: 0), animated: false)
    
    if carouselAutoplay {
      if carouselLoopTimer == nil {
        carouselLoopTimer = NSTimer.scheduledTimerWithTimeInterval(carouselPeriodTime, target: self, selector: Selector("loopCarousel"), userInfo: nil, repeats: true)
      }
    }
    
  }
    
    //设置网络加载图片
    func getImagePic(imageName:String)-> HYBLoadingImageView {
        let imageView = HYBLoadingImageView();
        imageView.frame = CGRectMake(0, 0, carouselScrollView.frame.size.width, carouselScrollView.frame.size.height);
        //预加载图片
        imageView.image = UIImage(named: "2.jpg")
        //println(imageView.image)
        imageView.loadImage(imageName, holder: "") { (image) -> () in
            //println("加载成功了");
        }
        
        return imageView
    }
    
  
  func carouselBtnTapped(sender: UIButton) {
    if delegate != nil {
      delegate.carouselView(self, didSelectedPageAtIndex: sender.tag)
    }
  }
  
  func loopCarousel() {
    let pageWidth = carouselScrollView.frame.size.width
    var currentPage = Int(carouselScrollView.contentOffset.x / pageWidth)
    if currentPage == 0 {
      carouselPageControl.currentPage = carouselPageControl.numberOfPages - 1
    } else if currentPage == carouselPageControl.numberOfPages + 1 {
      carouselPageControl.currentPage = 0
    } else {
      carouselPageControl.currentPage = currentPage - 1
    }

    var currPageNumber = carouselPageControl.currentPage
    let viewSize = carouselScrollView.frame.size
    let rect = CGRect(x: CGFloat(currPageNumber + 2) * pageWidth, y: 0, width: viewSize.width, height: viewSize.height)
    
    UIView.animateWithDuration(0.7, animations: {
      self.carouselScrollView.scrollRectToVisible(rect, animated: false)
    }, completion: { finished in
      currPageNumber++
      if currPageNumber == self.carouselPageControl.numberOfPages {
        self.carouselScrollView.setContentOffset(CGPoint(x: self.carouselScrollView.frame.size.width, y: 0), animated: false)
        currPageNumber = 0
      }
    })
    
    currentPage = Int(carouselScrollView.contentOffset.x / pageWidth)
    if currentPage == 0 {
      carouselPageControl.currentPage = carouselPageControl.numberOfPages - 1
    } else if currentPage == carouselPageControl.numberOfPages + 1 {
      carouselPageControl.currentPage = 0
    } else {
      carouselPageControl.currentPage = currentPage - 1
    }
  }
  
}

extension DHCarouselView: UIScrollViewDelegate {
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    var currentCarouselPage = Int(carouselScrollView.contentOffset.x / carouselScrollView.frame.size.width)
    if currentCarouselPage == 0 {
      scrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: carouselScrollView.frame.size.width * CGFloat(carouselPageControl.numberOfPages), y: 0), size: carouselScrollView.frame.size), animated: false)
      currentCarouselPage = carouselPageControl.numberOfPages - 1
    } else if currentCarouselPage == carouselPageControl.numberOfPages + 1 {
      scrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: carouselScrollView.frame.size.width, y: 0), size: carouselScrollView.frame.size), animated: false)
        //carouselPageControl.currentPage = 0
        currentCarouselPage = 0
    } else {
      currentCarouselPage = currentCarouselPage - 1
    }
    carouselPageControl.currentPage = currentCarouselPage
    
    if carouselAutoplay {
      if carouselLoopTimer == nil {
        carouselLoopTimer = NSTimer.scheduledTimerWithTimeInterval(carouselPeriodTime, target: self, selector: Selector("loopCarousel"), userInfo: nil, repeats: true)
      }
    }
  }
  
  func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    if carouselAutoplay {
      if carouselLoopTimer != nil {
        carouselLoopTimer.invalidate()
        carouselLoopTimer = nil
      }
    }
  }
  
}
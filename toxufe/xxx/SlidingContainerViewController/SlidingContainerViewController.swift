//
//  SlidingContainerViewController.swift
//  SlidingContainerViewController
//
//  Created by Cem Olcay on 10/04/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

@objc protocol SlidingContainerViewControllerDelegate {
    optional func slidingContainerViewControllerDidMoveToViewController (slidingContainerViewController: SlidingContainerViewController, viewController: UIViewController, atIndex: Int)
    optional func slidingContainerViewControllerDidHideSliderView (slidingContainerViewController: SlidingContainerViewController)
    optional func slidingContainerViewControllerDidShowSliderView (slidingContainerViewController: SlidingContainerViewController)
}

class SlidingContainerViewController: UIViewController, UIScrollViewDelegate, SlidingContainerSliderViewDelegate {
    
    var contentViewControllers: [UIViewController]!
    var contentScrollView: UIScrollView!
    var titles: [String]!
    
    var sliderView: SlidingContainerSliderView!
    var sliderViewShown: Bool = true
    
    var delegate: SlidingContainerViewControllerDelegate?
    
    
    // MARK: Init
    
    
    
    init (parent: UIViewController, contentViewControllers: [UIViewController], titles: [String]) {
        var keshiColor:UIColor?
        super.init(nibName: nil, bundle: nil)
        self.contentViewControllers = contentViewControllers
        self.titles = titles
        
        
        // Move to parent
        
        willMoveToParentViewController(parent)
        parent.addChildViewController(self)
        didMoveToParentViewController(parent)
        //根据标题信息显示内容
        if titles[0] == "科室" {
            keshiColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        }else if titles[0] == "登陆" {
            keshiColor = returnRgb(255)
        }else{
            keshiColor = returnRgb(255)
        }
        
        
        // Setup Views
        
        sliderView = SlidingContainerSliderView (width: (view.frame.size.width), titles: titles,Color:keshiColor!)
        sliderView.frame.origin.y = parent.topLayoutGuide.length
        sliderView.sliderDelegate = self
        
        contentScrollView = UIScrollView (frame: view.frame)
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.pagingEnabled = true
        contentScrollView.scrollsToTop = false
        contentScrollView.delegate = self
        contentScrollView.contentSize.width = contentScrollView.frame.size.width * CGFloat(contentViewControllers.count)
        
        view.addSubview(contentScrollView)
        view.addSubview(sliderView)
        //println(1)
        
        // Add Child View Controllers
        
        var currentX: CGFloat = 0
        for vc in contentViewControllers {
            vc.view.frame = CGRect (
                x: currentX,
                y: parent.topLayoutGuide.length,
                //y: 50,
                width: (view.frame.size.width),
                height: view.frame.size.height - parent.topLayoutGuide.length - parent.bottomLayoutGuide.length)

            
            
            contentScrollView.addSubview(vc.view)
            
            currentX += contentScrollView.frame.size.width
            //动画关闭
            setCurrentViewControllerAtIndex1(0)
        }

 
        
        
        // Move First Item
        
        
        //setCurrentViewControllerAtIndex(0)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //setCurrentViewControllerAtIndex(0)

    }
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    
    // MARK: ChildViewController Management
    
    func setCurrentViewControllerAtIndex (index: Int) {
    
        for i in 0..<self.contentViewControllers.count {
            let vc = contentViewControllers[i]
           
            
            if i == index {
                vc.willMoveToParentViewController(self)
                addChildViewController(vc)
                vc.didMoveToParentViewController(self)
                
                delegate?.slidingContainerViewControllerDidMoveToViewController? (self, viewController: vc, atIndex: index)
            } else {
    
                vc.willMoveToParentViewController(self)
                vc.removeFromParentViewController()
                vc.didMoveToParentViewController(self)
            }
        }
        
        
            sliderView.selectItemAtIndex(index)
 
        
        
            contentScrollView.setContentOffset(
            CGPoint (x: contentScrollView.frame.size.width * CGFloat(index), y: 0),
            animated: true)
        
        navigationController?.navigationItem.title = titles[index]
        
        //println(index)
//        if index == 1 {
//            println("注册成功")
//            var labelView = contentViewControllers[Int(1)].viewWithTag(3) as! UILabel
//            if labelView.text == "OK" {
//                println(111)
//            }
//
//        }
    }
    
    func setCurrentViewControllerAtIndex1 (index: Int) {
        
        for i in 0..<self.contentViewControllers.count {
            let vc = contentViewControllers[i]
            ///println(111)
            
            if i == index {
                
                vc.willMoveToParentViewController(self)
                addChildViewController(vc)
                vc.didMoveToParentViewController(self)
                
                delegate?.slidingContainerViewControllerDidMoveToViewController? (self, viewController: vc, atIndex: index)
            } else {
                
                vc.willMoveToParentViewController(self)
                vc.removeFromParentViewController()
                vc.didMoveToParentViewController(self)
            }
        }
        
        
        sliderView.selectItemAtIndex1(index)
        
        
        
        contentScrollView.setContentOffset(
            CGPoint (x: contentScrollView.frame.size.width * CGFloat(index), y: 0),
            animated: true)
        
        navigationController?.navigationItem.title = titles[index]
    }
    
    
    // MARK: SlidingContainerSliderViewDelegate
    
    func slidingContainerSliderViewDidPressed(slidingContainerSliderView: SlidingContainerSliderView, atIndex: Int) {
        sliderView.shouldSlide = false
        setCurrentViewControllerAtIndex(atIndex)
    }
    
    
    // MARK: SliderView
    
    func hideSlider () {
        
        if !sliderViewShown {
            return
        }
        
        UIView.animateWithDuration(1111,
            animations: {
                [unowned self] in
                self.sliderView.frame.origin.y += self.parentViewController!.topLayoutGuide.length + self.sliderView.frame.size.height
            },
            completion: {
                [unowned self] finished in
                self.sliderViewShown = false
                self.delegate?.slidingContainerViewControllerDidHideSliderView? (self)
            })
    }
    
    func showSlider () {
        
        if sliderViewShown {
            return
        }
        
        UIView.animateWithDuration(11111,
            animations: {
                [unowned self] in
                self.sliderView.frame.origin.y -= self.parentViewController!.topLayoutGuide.length + self.sliderView.frame.size.height
            },
            completion: {
                [unowned self] finished in
                self.sliderViewShown = true
                self.delegate?.slidingContainerViewControllerDidShowSliderView? (self)
            })
    }
    
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.panGestureRecognizer.state == .Began {
            sliderView.shouldSlide = true
        }
        
        let contentW = contentScrollView.contentSize.width - contentScrollView.frame.size.width
        let sliderW = sliderView.contentSize.width - sliderView.frame.size.width
        
        let current = contentScrollView.contentOffset.x
        let ratio = current / contentW
        
        if sliderView.contentSize.width > sliderView.frame.size.width && sliderView.shouldSlide == true {
            sliderView.contentOffset = CGPoint (x: sliderW * ratio, y: 0)
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / contentScrollView.frame.size.width
        setCurrentViewControllerAtIndex(Int(index))
    }
}

extension UIGestureRecognizerState: Printable {
    public var description: String {
        get {
            switch self {
            case .Began:
                return "Began"
            case .Cancelled:
                return "Cancelled"
            case .Changed:
                return "Changed"
            case .Ended:
                return "Ended"
            case .Failed:
                return "Failed"
            case .Possible:
                return "Possible"
            }
        }
    }
}

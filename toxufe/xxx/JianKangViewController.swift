//
//  JianKangViewController.swift
//  xxx
//
//  Created by txf on 15/6/25.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit
import Alamofire

class JianKangViewController: UIViewController,DHCarouselViewDelegate,UIScrollViewDelegate {
    

    @IBOutlet weak var uiPageCon: UIPageControl!
    @IBOutlet weak var jdtView: UIView!
    @IBOutlet weak var uiScroll: UIScrollView!
    var carouselView: DHCarouselView!
    var timer: NSTimer!
    @IBOutlet weak var searchBG: UIView!
    //轮播图片数组
    @IBOutlet weak var lunBoTuView: UIView!
    //搜索栏文本输入
    @IBOutlet weak var searchTF: UITextField!
    var picArray = [String]()
    //加载一次
    var loadingOnce = false
    //视图宽高
    var viewWidth:CGFloat?
    var viewHeight:CGFloat?
    //导航条高度
    var daohangHei:CGFloat?
    var pageCount = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewWidth = self.view.frame.size.width
        self.automaticallyAdjustsScrollViewInsets = false
        //获取导航条高度
        self.daohangHei = self.navigationController!.navigationBar.frame.size.height

        //通过网络获取JSON数据+轮播图
        getJsonFile()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //pageControl
        uiPageCon.pageIndicatorTintColor = returnRgb(204)
        uiPageCon.numberOfPages = pageCount
        
        //滚动视图委托事件
        menuUIscroll.delegate = self
        
        //搜索栏文本输入属性 
        //文本框左边内边句
        searchTF.leftViewMode = UITextFieldViewMode.Always
        searchTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        //设置文本框字体
        searchTF.font = returnFont(16)

        
    }
    
    
    //搜索栏背景UI
    @IBAction func searchBgUw(sender: UIControl) {
        //取消键盘第一响应事件
        searchTF.resignFirstResponder()
        println("xxx")
    }
    
    //搜索栏圆角
    func searchLan(){
        //密码背景圆角
        var maskPath1 = UIBezierPath(roundedRect: self.searchBG.bounds, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSizeMake(10, 10))
        var maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.searchBG.bounds
        maskLayer1.path = maskPath1.CGPath
        self.searchBG.layer.mask = maskLayer1
    }
    
    
    @IBAction func searchThings(sender: UIButton) {
        //取消键盘第一响应时间
        searchTF.resignFirstResponder()
        println("放大镜事件")
    }
    
    //滚动事件
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var currentCarouselPage = Int(menuUIscroll.contentOffset.x / menuUIscroll.frame.size.width)
        if currentCarouselPage == 0 {
            menuUIscroll.scrollRectToVisible(CGRect(origin: CGPoint(x: menuUIscroll.frame.size.width * 2, y: 0), size: menuUIscroll.frame.size), animated: false)
            currentCarouselPage = uiPageCon.numberOfPages-1
        } else if currentCarouselPage == uiPageCon.numberOfPages + 1 {
            scrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: menuUIscroll.frame.size.width, y: 0), size: menuUIscroll.frame.size), animated: false)
            //carouselPageControl.currentPage = 0
            currentCarouselPage = 0
        } else {
            currentCarouselPage = currentCarouselPage - 1
        }
        uiPageCon.currentPage = currentCarouselPage
    }

    
    //点击图片事件
    func carouselView(carouselView: DHCarouselView, didSelectedPageAtIndex index: NSInteger){
        //图片点击事件从零开始
        println("您点击了第\(index)张图片！")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //重置view尺寸 把导航条的高度提炼出来
        //jdtView.frame = CGRectMake(0, self.daohangHei!, self.viewWidth!, self.jdtView.frame.size.height)
        
        //在这块设置导航栏颜色
        let titlerFont  = returnFont(19)
        let titlerColor = returnRgb(255)
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        
        //导航栏背景色
        let mainColor = returnRgb(102)
        self.navigationController?.navigationBar.barTintColor = mainColor
        //设置滚动视图不向上移动
        self.automaticallyAdjustsScrollViewInsets = false
        //显示tabbar
        self.tabBarController?.tabBar.hidden = false
        
        
        
        
        

    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //取消键盘第一响应时间
        textField.resignFirstResponder()
        println("我是键盘搜索事件")
        return true
    }

    
    
    var arrJudge = false
    func getJsonFile(){
        
        //判断有没有联网
        var isCon = getNetwork_Yuye()
        if !isCon {
            self.noticeOnlyText("无网络连接")
            return
        }
        
        
        

        
        
        
        //使用默认配置
        let manager = Alamofire.Manager.sharedInstance
        //网络验证
        //联网等待
        self.pleaseWait()
        //暂时只能通过PHP文件读取资源 不能直接读取JS
        let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/Resource/Json/jkys.php")
        manager.request(.POST,URL!).responseJSON() {
            (request, response, JSON, error) in
            if error == nil {
                //清除等待
                self.clearWaitNotice()
                //重新赋值数组数据
                //先清空数组
                self.picArray.removeAll(keepCapacity: true)
                //遍历JSON文件添加数组数据
                let images = JSON! as! NSArray
                
                if self.arrJudge == false {
                    for v in  images {
                        self.picArray.append(v as! String)
                    }
                    
                    self.arrJudge = true
                    //插入轮播图
                    self.addLunbotu()
                    
                }
                

                
                return
            }else {
                //清除等待
                //println(error)
                //println(error?.userInfo)
                self.clearWaitNotice()
                self.noticeOnlyText("网络连接超时...")
                return
            }
            
            
        }
    }
    //插入轮播图
    func addLunbotu(){
        if self.picArray.count > 0 {
            
            //清除所有缓存
            //picArray = []

        }else {
            picArray = ["http://pic.nipic.com/2007-11-09/2007119122519868_2.jpg","http://www.nanningjie.com/uploads/allimg/140528/16051M160-0.jpg","http://pica.nipic.com/2007-12-18/200712189215503_2.jpg","http://jpppt.com/uploads/allimg/130405/1-1304051331445c.jpg"]
        
            }
        self.viewHeight = self.jdtView.frame.size.height
        if self.loadingOnce == false {
            self.carouselView = DHCarouselView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.viewWidth!, height: self.viewHeight!)))
            self.carouselView.delegate = self
            self.carouselView.carouselDataArray = self.picArray
            self.carouselView.loadCarouselDataThenStart()
            
            self.jdtView.addSubview(self.carouselView)
            self.loadingOnce = true
            

            
//            for view : AnyObject in carouselView.subviews
//            {
//                if view is UIScrollView
//                {
//                    //view.removeFromSuperview()
//                    println(view.subviews)
//                }
//            }
        }
    }
    
    @IBOutlet weak var menuUiview: UIView!
    //底部菜单滚动试图
    @IBOutlet weak var menuUIscroll: UIScrollView!
    //执行一次变量
    var menuOnce = true
    override func viewDidLayoutSubviews() {
        
        //搜索栏圆角
        searchLan()
        if menuOnce {

            var viewy = menuUiview.frame.origin.y
            var viewH = menuUiview.frame.size.height
            if let v = self.viewWidth {
                var viewW = v
                
                //menuUIscroll.frame = CGRectMake(0, 20, viewW, viewH)
                //menuUIscroll.contentSize = CGSize(width: viewW*2, height: menuUiview.frame.size.height)
//                menuUIscroll.contentOffset = CGPoint(x: 0, y: 0)
//                menuUIscroll.indicatorStyle = UIScrollViewIndicatorStyle.Black
//                menuUIscroll.backgroundColor = UIColor.blueColor()
            }
        }
        
        menuOnce = false
    }
    
    

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  LoginTableViewController.swift
//  xxx
//
//  Created by txf on 15/5/30.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit
import Alamofire


class LoginTableViewController: UIViewController {
    //手机号码
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var findMima: UIButton!
    @IBOutlet weak var IBView: UIControl!
    //登录
    @IBAction func login(sender: UIButton) {
        //println(111)
        //登录函数
        Login()

    }
    

    
    //弹窗简单封装
    func alertShow( title :String,message:String,cancelButtonTitle:String){
        var alertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: cancelButtonTitle)
        //显示弹窗
        alertView.show()
    }
    
    
//    @IBAction func loginView(sender: UIControl) {
//        println(111)
    //}
    
//    //获取网络状态
//    func getNetWorkStates() {
//        var app = UIApplication.sharedApplication()
//        var children = [app.valueForKey("statusBar")!.valueForKey("foregroundView")!.subviews]
//        var state = ""
//        var netType = 0
//        
//        if !children.isEmpty {
//            for (id,child) in (children) {
//                println(child)
//            }
//        }
//
//        
//        
//        
//    }
    
    var iosversion = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //getNetWorkStates()
//        iosversion = UIDevice.currentDevice().systemVersion //ios版本
//        println(iosversion)
//        
//        if displayValue >= 8.0 {
//            println("xxx")
//        }
        

        //手机号码框
        userPhone.font = returnFont(16.0)
        userPhone.attributedPlaceholder = NSAttributedString(string:userPhone.placeholder!, attributes: [NSForegroundColorAttributeName: returnRgb(204)]);
        //密码框
        passWord.font = returnFont(16.0)
        passWord.attributedPlaceholder = NSAttributedString(string:passWord.placeholder!, attributes: [NSForegroundColorAttributeName: returnRgb(204)]);
        
        //放在第一排生效
        //登录按钮
        LoginButton.backgroundColor = UIColor.whiteColor()
        LoginButton.titleLabel?.font = returnFont(18.0)
        LoginButton.layer.borderWidth = 1
        LoginButton.layer.borderColor = returnRgb(204).CGColor as CGColorRef
        LoginButton.layer.cornerRadius = 5
        //找回密码
        findMima.titleLabel?.font = returnFont(14.0)
        let findColor = UIColor(red: 255/255, green: 102/255, blue: 0, alpha: 1)
        findMima.setTitleColor(findColor,forState: .Normal) //普通状态下文字的颜
        //一个布尔值，它决定了是否用户触发的事件被该视图对象忽略和把该视图对象从事件响应队列中移除。
        IBView.userInteractionEnabled = true
        
        
//        //设置圆角
//        //phoneBg.layer.cornerRadius = 10
//        
//        var maskPath = UIBezierPath(roundedRect: phoneBg.bounds, byRoundingCorners: UIRectCorner.TopLeft|UIRectCorner.TopRight, cornerRadii: CGSizeMake(10, 10))
//        var maskLayer = CAShapeLayer()
//        maskLayer.frame = phoneBg.bounds
//        maskLayer.path = maskPath.CGPath
//        phoneBg.layer.mask = maskLayer

        
        
        

        
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.frame = view2.bounds;
//        maskLayer.path = maskPath.CGPath;
//        view2.layer.mask = maskLayer;
        
    }
    @IBOutlet weak var phoneBg: UIView!
    
    @IBOutlet weak var passBg: UIView!
    
    override func viewDidLayoutSubviews() {
        //println(phoneBg)
        //设置圆角
        //phoneBg.layer.cornerRadius = 10
        //手机背景圆角
        var maskPath = UIBezierPath(roundedRect: phoneBg.bounds, byRoundingCorners: UIRectCorner.TopLeft|UIRectCorner.TopRight, cornerRadii: CGSizeMake(5, 5))
        var maskLayer = CAShapeLayer()
        maskLayer.frame = phoneBg.bounds
        maskLayer.path = maskPath.CGPath
        phoneBg.layer.mask = maskLayer
        //密码背景圆角
        var maskPath1 = UIBezierPath(roundedRect: passBg.bounds, byRoundingCorners: UIRectCorner.BottomLeft|UIRectCorner.BottomRight, cornerRadii: CGSizeMake(5, 5))
        var maskLayer1 = CAShapeLayer()
        maskLayer1.frame = passBg.bounds
        maskLayer1.path = maskPath1.CGPath
        passBg.layer.mask = maskLayer1
        
        
    }
    
    //获取设备版本信息
    func versionCheck(){
            
        let infoDictionary = NSBundle.mainBundle().infoDictionary
            
//        let appDisplayName = infoDictionary["CFBundleDisplayName"]!
//            
//        let majorVersion :AnyObject? = infoDictionary ["CFBundleShortVersionString"]
//            
//        let minorVersion :AnyObject? = infoDictionary ["CFBundleVersion"]
//            
//        let appversion = majorVersionasString
//            
//        letiosversion : NSString= UIDevice.currentDevice().systemVersion //ios版本
//            
//        letidentifierNumber = UIDevice.currentDevice().identifierForVendor //设备udid
//            
//        letsystemName = UIDevice.currentDevice().systemName //设备名称
//            
//        letmodel = UIDevice.currentDevice().model //设备型号
//            
//        letlocalizedModel = UIDevice.currentDevice().localizedModel //设备区域化型号如A1533
        
        //println(appversion)
            
    }



//    override func viewDidAppear(animated: Bool){
//        super.viewDidAppear(animated)
//        //println("出现")
//    
//    }
//    override func viewWillAppear(animated: Bool) {
//        //println("即将出现")
//    }
    
    @IBAction func FindMimaYuye(sender: UIButton) {
        //调转找回密码页面
        var FindMimaStory:UIStoryboard = UIStoryboard(name: "FindMima", bundle: NSBundle.mainBundle()) as UIStoryboard
        var FindMimaContro:FindMimaViewController = FindMimaStory.instantiateViewControllerWithIdentifier("FindMima") as! FindMimaViewController
        
        //FindMimaContro.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        //FindMimaContro.modalPresentationStyle = UIModalPresentationFullScreen;
        //FindMimaContro.modalTransitionStyle = UIModalTransitionStyle.PartialCurl

        
        self.navigationController?.pushViewController(FindMimaContro, animated: true)
        //self.presentViewController(FindMimaContro, animated: true, completion: nil)
        
    }
    @IBAction func yincangKey(sender: UIControl) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //取消键盘第一响应事件
        textField.resignFirstResponder()
        //登录函数
        Login()
        return true
    }
    //登录函数做封装
    func Login(){
        ////////////////////////////////////////////////////////
        //tabbar===>HIDDEN
        //var navar(self.navigationController?.viewControllers)
        var navArry = NSMutableArray(array: self.navigationController!.viewControllers)
        //println(navArry)
        for (index,num) in enumerate(navArry) {
            if navArry.count >= 3 {
                if index == 1 {
                    navArry.removeObjectAtIndex(1)
                    break
                }
            }

        }
        
        //println(navArry)
        //println(navArry)
        self.navigationController?.viewControllers = navArry as [AnyObject]
        //println(navArry)
        ////////////////////////////////////////////////////////
        
        
        
        
        
        //获取网络是否连接
        var isNetwork = getNetwork_Yuye()
        if !isNetwork {
            self.noticeOnlyText("您的网络未连接哦！")
            return
        }

        //用户名
        var userphone = userPhone.text
        //密码
        var password  = passWord.text
        //验证不为空
        //出对话框提示用户名或密码为空
        if userphone == "" || password == "" {
            //println("用户名或者密码为空")
            //self.alertShow("小美提示", message: "您的用户名或密码为空", cancelButtonTitle: "我知道了")
            noticeOnlyText("您的用户名或密码为空")
            return
        }
        
        

        
        //self.manager.requestSerializer.timeoutInterval
       // self.manager.requestSerializer.timeoutInterval

        
        //网络默认配置
//        var alamofireManager : Alamofire.Manager?
//        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        //timeoutIntervalForRequest/timeoutIntervalForResource前者每次有新data到达时重置;后者限制了整个资源请求时长，不要搞混了
//        //configuration.timeoutIntervalForRequest = 0.3 //超时设置 秒
//        configuration.timeoutIntervalForResource  = 13 //超时设置 秒
//        Alamofire.Manager(configuration: configuration)
        
        
        // session配置
//        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
//        defaultHeaders["DNT"] = "1 (Do Not Track Enabled)"
//        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
//        // 配置超時時間為10秒
//        config.timeoutIntervalForRequest = 1
//        
//        config.HTTPAdditionalHeaders = defaultHeaders
//        // 建立session
//        let session = Alamofire.Manager(configuration: config)
//        let manager = Alamofire.Manager.sharedInstance
        

//        self.alamofireManager = Alamofire.Manager(configuration: configuration)
//        self.alamofireManager!.request(.GET, "http://example.com/")
//            .response { (request, response, data, error) in
//                
        //}
        

        //定时器
//        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerFireMethod:", userInfo: nil, repeats:true)
//        timer.fire()
        //timer.invalidate()
        //timer.valid
        

        let manager = Alamofire.Manager.sharedInstance
        
        

        //manger.responseSerializer = [AFHTTPResponseSerializerserializer];
        //manger.requestSerializer = [AFHTTPRequestSerializerserializer];
        
        //manger.responseSerializer = [AFHTTPResponseSerializerserializer];
        
        
        //网络验证
        //联网等待
        self.pleaseWait()
        var parameters = ["phone": userphone,"password":password]
        let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/User/login.php")
        manager.request(.POST,URL!, parameters: parameters).responseJSON() {
        (request, response, JSON, error) in
            if error == nil {
                //清除等待
                self.clearWaitNotice()
                //叹号作用拆包 可选包 有值 无值 叹号解析有值
                //提示字符串
                let str = JSON!.valueForKey("str")! as! String
                //状态代码
                let stu = JSON!.valueForKey("stu")! as! Int

                //println(Userinfo["userid"]!)
            
                if (stu != 7) {
                    //self.alertShow("小美提示", message: str, cancelButtonTitle: "我知道了")
                    self.noticeOnlyText(str)
                    return
                }else if (stu == 7) {
                    self.successNotice(str)
                    //用户信息列表
                    let Userinfo: NSDictionary = JSON!.valueForKey("info")! as! NSDictionary
                    if Userinfo.count >= 0 {
                        //数据储存方式
                        for (rowid,key) in Userinfo {
                            var cunshun:NSArray = ["userid", "userfen", "money", "phone"]
                            var index = cunshun.indexOfObject(rowid)
                            //查找元素的索引，如果包含特定元素，返回具体索引，否则返回：9223372036854775807
                            if String(index) !=  "9223372036854775807" {
                                //println("YES")
                                NSUserDefaults.standardUserDefaults().setObject(key, forKey: rowid as! String)                                
                            }
                        }
                    }
                }
                
                //页面反向跳转
                
                self.navigationController?.popToRootViewControllerAnimated(true)
                return
            }else {
                //清除等待
                println(error)
                self.clearWaitNotice()
                self.noticeOnlyText("网络连接超时...")
            }
            
            
        }
        
        
        //数据储存方式
        //NSUserDefaults.standardUserDefaults().setObject(userphone, forKey: "xxx")
        //页面反向跳转
        //self.navigationController?.popViewControllerAnimated(true)
    }
    //字符串转换成Double
    var displayValue : Double{
        get{
            return NSNumberFormatter().numberFromString(iosversion)!.doubleValue
        }
        set{
            iosversion = "\(newValue)"
        }
    }
//    var times = 0
//    func timerFireMethod (timer: NSTimer){
//       println(times++)
//        if times >= 15 {
//            //定时器状态
//            if timer.valid {
//                //定时器失效
//                timer.invalidate()
//               // println(Alamofire.Request.Validation.self)
//                //Alamofire.Request.cancel()
//                //LoginButton.req
//                //Alamofire.Request.cancel({self.Login()})
//                
//                //初始化
//                times = 0
//                self.clearWaitNotice()
//                self.noticeOnlyText("网络连接超时...")
//                return
//            }
//        }
//        
//    }
    

    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    


    
}

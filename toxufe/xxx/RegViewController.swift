//
//  RegViewController.swift
//  xxx
//
//  Created by txf on 15/6/1.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit
import Alamofire

class RegViewController: UIViewController {

    @IBOutlet weak var yzmTF: UITextField!
    @IBOutlet weak var resBtn: UIButton!
    @IBOutlet weak var userphoneTF: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var getYzm: UIButton!
    @IBOutlet weak var phoneBg: UIView!
    @IBOutlet weak var yzmBg: UIView!
    


    
    
    @IBAction func resUserBtn(sender: UIButton) {
        
        //println(sender.currentTitle)
        var phone = userphoneTF.text
        var password = passwordTf.text
        var yzm = yzmTF.text
        //注册函数
        regUSER(phone , password: password , yzm: yzm)

        //println(111)
    }
    override func viewDidLayoutSubviews() {
        //设置圆角
        //phoneBg.layer.cornerRadius = 10
        //手机背景圆角
        var maskPath = UIBezierPath(roundedRect: phoneBg.bounds, byRoundingCorners: UIRectCorner.TopLeft|UIRectCorner.TopRight, cornerRadii: CGSizeMake(5, 5))
        var maskLayer = CAShapeLayer()
        maskLayer.frame = phoneBg.bounds
        maskLayer.path = maskPath.CGPath
        phoneBg.layer.mask = maskLayer
        //密码背景圆角
        var maskPath1 = UIBezierPath(roundedRect: yzmBg.bounds, byRoundingCorners: UIRectCorner.BottomLeft|UIRectCorner.BottomRight, cornerRadii: CGSizeMake(5, 5))
        var maskLayer1 = CAShapeLayer()
        maskLayer1.frame = yzmBg.bounds
        maskLayer1.path = maskPath1.CGPath
        yzmBg.layer.mask = maskLayer1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //手机号码框
        userphoneTF.font = returnFont(16.0)
        userphoneTF.attributedPlaceholder = NSAttributedString(string:userphoneTF.placeholder!, attributes: [NSForegroundColorAttributeName: returnRgb(204)]);
        //密码框
        passwordTf.font = returnFont(16.0)
        passwordTf.attributedPlaceholder = NSAttributedString(string:passwordTf.placeholder!, attributes: [NSForegroundColorAttributeName: returnRgb(204)]);
        
        //验证码
        yzmTF.font = returnFont(16.0)
        yzmTF.attributedPlaceholder = NSAttributedString(string:yzmTF.placeholder!, attributes: [NSForegroundColorAttributeName: returnRgb(204)]);
        
        
        
        //放在第一排生效
        //登录按钮
        resBtn.userInteractionEnabled = true
        resBtn.enabled = true
        resBtn.titleLabel?.font = returnFont(18.0)
        resBtn.layer.borderWidth = 1
        resBtn.layer.borderColor = returnRgb(204).CGColor as CGColorRef
        resBtn.layer.cornerRadius = 5
        resBtn.setTitleColor(UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1), forState: UIControlState.Normal)

        //bringSubviewToFront
        
//        resBtn.titleLabel?.userInteractionEnabled = true
//        resBtn.titleLabel?.enabled = true
//        resBtn.titleLabel?.text = "xxxx"
//        resBtn.setTitle("xxxx", forState: UIControlState.Normal)
//        resBtn.bringSubviewToFront(view!.viewWithTag(5)!)

        
        //添加事件
        //resBtn.addTarget(self, action: "hello", forControlEvents: UIControlEvents.TouchUpInside)
        
        //获取验证码
        getYzm.titleLabel?.font = returnFont(15.0)
        getYzm.setTitleColor(UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1), forState: UIControlState.Normal)

        //label.addGestureRecognizer(UITapGestureRecognizer (target: self, action: "didTap:"))
        //self.view.addGestureRecognizer(ui )UISwipeGestureRecognizer
        
        
        
        
        

    }
    
//    func hello(){
//        println("我是测试按钮")
//    }
    
    //开始编辑输入框的时候，软键盘出现，执行此事件
    func textFieldDidBeginEditing(textField: UITextField) {
        //println(textField.tag)
        if textField.tag == 2 {
            //键盘遮挡 动画效果
//            UIView.animateWithDuration(0.4, animations: {
//                self.view.frame.origin.y = -60
//            })
        }
    }
    
    //百度键盘最小化
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        //键盘遮挡 动画效果
//        UIView.animateWithDuration(0.4, animations: {
//            self.view.frame.origin.y = 0
//        })
        
        return true
    }
    
    

    
    @IBAction func testPage() {


//        //页面切换
//        var fatherUIScrollView = self.view.superview! as! UIScrollView
//        UIView.animateWithDuration(0.4, animations: {
//            fatherUIScrollView.contentOffset.x = 0
//        })
//        
//        
//        
//        //滚动条切换
//        //var fatherUIView = self.view.viewForBaselineLayout()
//        var fatherUIView = self.view.superview
//        fatherUIView!.backgroundColor = UIColor.blackColor()
//        println(fatherUIView)
        
        //var loginStory = UIStoryboard(name: "LoginStoryboard", bundle: NSBundle.mainBundle())
        //var loginController:LoginTableViewController = loginStory.instantiateViewControllerWithIdentifier("Login") as! LoginTableViewController
        //var modeView = loginController
        
        //self.viewWillDisappear(true)
        //modeView.removeFromParentViewController()
   
        
        
        //LoginResViewController().removeFromParentViewController()
        //LoginResViewController().viewDidLayoutSubviews()
        
        

//        
//        var loginStory = UIStoryboard(name: "LoginResStoryboard", bundle: NSBundle.mainBundle())
//        var loginController:LoginResViewController = loginStory.instantiateViewControllerWithIdentifier("loginRes") as! LoginResViewController
//        var modeView = loginController
//        self.navigationController?.pushViewController(modeView, animated: true)
//        
//        //从堆栈中删除上一个
//        var navigationarray = NSMutableArray(array: self.navigationController!.viewControllers!)
//        println(navigationarray)
//        //删除最后一个
//        if navigationarray.count>=2 {
//            navigationarray.removeObjectAtIndex(navigationarray.count-2)
//            //重新赋值
//            self.navigationController?.viewControllers = navigationarray as NSMutableArray as [AnyObject]
//        }

        


        
        
        

    }
    
    
    
    //发送验证码短信
    @IBAction func getYzm(sender: UIButton) {
        var phone = userphoneTF.text
        //获取网络是否连接
        var isNetwork = getNetwork_Yuye()
        if !isNetwork {
            self.noticeOnlyText("您的网络未连接哦！")
            return
        }
        
        //手机号码不能为空
        if phone == "" {
            self.noticeOnlyText("电话号码不能为空")
            return
        }
        
        //网络请求
        let manager = Alamofire.Manager.sharedInstance
        //网络验证
        //联网等待
        self.pleaseWait()
        var parameter = ["phone": phone]
        let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/User/getYzm.php")
        manager.request(.POST,URL!, parameters: parameter).responseJSON() {
            (request, response, JSON, error) in
//            println(error)
//            println(request)
//            println(response)
//            println(JSON)
 
            if error == nil {
                //清除等待
                self.clearWaitNotice()
                //叹号作用拆包 可选包 有值 无值 叹号解析有值
                //提示字符串
                let str = JSON!.valueForKey("str")! as! String
                //状态代码
                let stu = JSON!.valueForKey("stu")! as! Int
                
                if (stu != 1) {
                    //短信发送失败
                    self.noticeOnlyText(str)
                    return
                }else if (stu == 1) {
                    //短信发送成功
                    //self.successNotice(str)
                    //开启定时器
                    var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerFireMethod:", userInfo: nil, repeats:true)
                    timer.fire()
                    //设置按钮标题
                    //sender.setTitle("lalala", forState: UIControlState.Normal)
                    //设置按钮禁用状态
                    sender.userInteractionEnabled = false
                    //设置按钮禁用状态
                    sender.enabled = false
                    //设置文字颜色
                    sender.setTitleColor(returnRgb(204), forState: UIControlState.Disabled)
                    //按钮倒计时颜色
                    var z = self.getBtnPosition()
                    self.getYzm.frame.origin.x = z
                    //sender.backgroundColor  = returnRgb(110)

                   
                    
                }
            
            }else{
                //清除等待
                self.clearWaitNotice()
                self.noticeOnlyText("网络连接超时...")
            }
            
        }
    }
    
    //按钮位置函数
    func getBtnPosition()->CGFloat{
        
        var z:CGFloat?
        //获取验证码左侧试图宽度
        var view1 = self.view.viewWithTag(1)!.frame.size.width
        var view2 = self.view.viewWithTag(2)!.frame.size.width
        var view3 = self.view.viewWithTag(3)!.frame.size.width
        z = (view1+view2+view3)
        return z!
    }
    
    //倒计时回调函数
    var remainSencods = 30
    var timeCount = 30
    func timerFireMethod(timer:NSTimer){
        var title = "\(timeCount)秒后重试"
        timeCount--
        getYzm.titleLabel?.text = title
        getYzm.setTitle(title, forState: UIControlState.Disabled)
        
        if timeCount < 0 {
            if timer.valid {
                //定时器失效
                timer.invalidate()
                //按钮恢复点击
                getYzm.userInteractionEnabled = true
                getYzm.enabled = true
                //按钮倒计时颜色
                getYzm.setTitle("重新发送", forState: UIControlState.Normal)
                //重置定时器
                timeCount = remainSencods
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yincangKey(sender: UIControl) {
        self.view.endEditing(true)
        
//        UIView.animateWithDuration(0.4, animations: {
//            self.view.frame.origin.y = 50
//        })
        //println(222)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //取消键盘第一响应事件
        textField.resignFirstResponder()
        //隐藏键盘
//        UIView.animateWithDuration(0.4, animations: {
//            self.view.frame.origin.y = 50
//        })
        //登录信息
        var phone = userphoneTF.text
        var password = passwordTf.text
        var yzm = yzmTF.text
        //注册函数
        regUSER(phone , password: password , yzm: yzm)
        return true
    }
    
    //注册函数
    func regUSER( phone: String , password : String , yzm : String ){
        //RegViewController().noticeOnlyText("111")
        var obj = RegViewController()
        
        //获取网络是否连接
        var isNetwork = getNetwork_Yuye()
        if !isNetwork {
            obj.noticeOnlyText("您的网络未连接哦！")
            return
        }
        
        //判断参数
        if phone == "" || password == "" || yzm == "" {
            obj.noticeOnlyText("缺少必要信息！")
            return
        }
        
        //网络请求
        let manager = Alamofire.Manager.sharedInstance
        //联网等待
        obj.pleaseWait()
        var parameter = ["phone": phone,"password": password,"yzm": yzm]
        let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/User/addUser.php")
        manager.request(.POST,URL!, parameters: parameter).responseJSON() {
            (request, response, JSON, error) in
            if error == nil {
                //清除等待
                obj.clearWaitNotice()
                //叹号作用拆包 可选包 有值 无值 叹号解析有值
                //提示字符串
                let str = JSON!.valueForKey("str")! as! String
                //状态代码
                let stu = JSON!.valueForKey("stu")! as! Int
                
                if (stu != 6 && stu != 1) {
                    //短信发送失败
                    obj.noticeOnlyText(str)
                    return
                }else if (stu == 6) {
                    //短信发送成功
                    obj.successNotice(str)
                    //跳转登录页面
                    self.goToLogin()
                }else if (stu == 1) {
                    //短信发送成功
                    obj.noticeOnlyText(str)
                    //跳转登录页面
                    self.goToLogin()
                }
                
            }else{
                //清除等待
                obj.clearWaitNotice()
                obj.noticeOnlyText("网络连接超时...")
            }
            
        }
        
        
        
    }
    //登录跳转页面
    var diaoBool = false
    func goToLogin(){

        var loginStory = UIStoryboard(name: "LoginResStoryboard", bundle: NSBundle.mainBundle())
        var loginController:LoginResViewController = loginStory.instantiateViewControllerWithIdentifier("loginRes") as! LoginResViewController
        var modeView = loginController
        if !diaoBool {
            
            self.navigationController!.pushViewController(modeView, animated: true)
            diaoBool = true
        }
        
        //从堆栈中删除上一个
        //var navigationarray = NSMutableArray(array: self.navigationController!.viewControllers!)
        //println(navigationarray)
        //删除最后一个
//        if navigationarray.count>=2 {
//            navigationarray.removeObjectAtIndex(navigationarray.count-2)
//        //重新赋值
//            self.navigationController?.viewControllers = navigationarray as NSMutableArray as [AnyObject]
//        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
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

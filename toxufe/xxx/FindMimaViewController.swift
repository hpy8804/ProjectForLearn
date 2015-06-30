//
//  FindMimaViewController.swift
//  xxx
//
//  Created by txf on 15/6/24.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit
import Alamofire

class FindMimaViewController: UIViewController {

    @IBOutlet weak var topFont: UILabel!
    @IBOutlet weak var topSate: UILabel!
    @IBOutlet weak var getYzm: UIButton!
    @IBOutlet weak var netStep: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fonC = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1)
        topFont.textColor = returnRgb(201.0)
        topSate.textColor = fonC
        topSate.font = returnFont(15.0)
        topFont.font = returnFont(15.0)
        topFont.sizeToFit()
        topSate.sizeToFit()
        
        //按钮样式
        getYzm.titleLabel?.font = returnFont(14.0)
        let findColor = UIColor(red: 255/255, green: 102/255, blue: 0, alpha: 1)
        getYzm.setTitleColor(findColor,forState: .Normal) //普通状态下文
        
        netStep.titleLabel?.font = returnFont(18.0)
        netStep.setTitleColor(findColor,forState: .Normal) //普通状态下文
        
        netStep.layer.borderWidth = 1
        netStep.layer.borderColor = returnRgb(204).CGColor as CGColorRef
        netStep.layer.cornerRadius = 5

        
        

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
    //获取验证码
    @IBOutlet weak var userphoneTf: UITextField!
    @IBOutlet weak var userYzm: UITextField!
    @IBAction func findPassWord() {
        //手机号码
        var phone = userphoneTf.text
        
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
                    self.getYzm.userInteractionEnabled = false
                    //设置按钮禁用状态
                    self.getYzm.enabled = false
                    //设置文字颜色
                    self.getYzm.setTitleColor(returnRgb(204), forState: UIControlState.Disabled)
                    //按钮倒计时颜色
                    //var z = self.getBtnPosition()
                    //self.getYzm.frame.origin.x = z
                    //sender.backgroundColor  = returnRgb(110)
                    
                    
                    
                }
                
            }else{
                //清除等待
                self.clearWaitNotice()
                self.noticeOnlyText("网络连接超时...")
            }
            
        }
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
    
    
    @IBAction func retrunTop(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
        //清除所有通知消息
        self.clearAllNotice()
    }
//    override func viewWillDisappear(animated: Bool) {
//        self.tabBarController?.tabBar.hidden = true
//    }
//    
//    override func viewDidDisappear(animated: Bool) {
//        //今天说的是在TabBar嵌套Nav时，进行Push的时候隐藏TabBar的问题。
//        self.hidesBottomBarWhenPushed = true
//    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func xgmm() {
        var phone = userphoneTf.text
        var yzm = userYzm.text
        
        //获取网络是否连接
        var isNetwork = getNetwork_Yuye()
        if !isNetwork {
            self.noticeOnlyText("您的网络未连接哦！")
            return
        }
        
        //手机号和验证码不为空
        if phone == "" || yzm == "" {
            self.noticeOnlyText("手机号或验证码为空")
            return
        }
        
        //网络请求
        let manager = Alamofire.Manager.sharedInstance
        
        //网络验证
        //联网等待
        self.pleaseWait()
        var parameter = ["phone": phone,"yzm": yzm]
        let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/User/judgeYzm.php")
        manager.request(.POST,URL!, parameters: parameter).responseJSON() {
            (request, response, JSON, error) in
            
            if error == nil {
                //清除等待
                self.clearWaitNotice()
                //叹号作用拆包 可选包 有值 无值 叹号解析有值
                //提示字符串
                let str = JSON!.valueForKey("str")! as! String
                //状态代码
                let stu = JSON!.valueForKey("stu")! as! Int
                
                if (stu != 2 && stu != 4) {
                    //验证失败
                    self.noticeOnlyText(str)
                    return
                }else if (stu == 2) {
                    //验证成功
                    //本地保存手机号和验证码
                    var userDefault = NSUserDefaults.standardUserDefaults()
                    userDefault.setObject(phone, forKey: "phone")
                    userDefault.setObject(yzm, forKey: "yzm")
                    //去往修改成功页面
                    self.goToXgmm()
                }else if (stu == 4) {
                    //该手机号未注册 不能修改密码
                    self.noticeOnlyText(str)
                    //去登录页面
                    //self.goToLogin()
                    return

                }
                
            }else{
                //清除等待
                self.clearWaitNotice()
                self.noticeOnlyText("网络连接超时...")
            }
            
        }

    }
    //去往修改密码页面
    func goToXgmm(){
        var xgmmStory = UIStoryboard(name: "Xgmm", bundle: NSBundle.mainBundle())
        var xgmmcontroller: XgmmViewController! = xgmmStory.instantiateViewControllerWithIdentifier("xgmm") as! XgmmViewController
        self.navigationController?.pushViewController(xgmmcontroller, animated: true)
    
    }
    //去登录页面
    func goToLogin(){
        var loginStory = UIStoryboard(name: "LoginResStoryboard", bundle: NSBundle.mainBundle())
        var loginController:LoginResViewController = loginStory.instantiateViewControllerWithIdentifier("loginRes") as! LoginResViewController
        var modeView = loginController
        self.navigationController?.pushViewController(modeView, animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //取消键盘第一响应事件
        textField.resignFirstResponder()
        //println(111)
        //下一步函数
        xgmm()
        return true
    }
    
    
    //百度键盘最小化
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
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

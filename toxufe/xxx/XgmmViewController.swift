//
//  XgmmViewController.swift
//  xxx
//
//  Created by txf on 15/6/24.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit
import Alamofire

class XgmmViewController: UIViewController {

    @IBOutlet weak var topFont: UILabel!
    @IBOutlet weak var topSate: UILabel!
    @IBOutlet weak var netStep: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let fonC = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1)
        topFont.textColor = fonC
        topSate.textColor = fonC
        topSate.font = returnFont(15.0)
        topFont.font = returnFont(15.0)
        topFont.sizeToFit()
        topSate.sizeToFit()
        
        //按钮样式

        
        netStep.titleLabel?.font = returnFont(18.0)
        netStep.setTitleColor(fonC,forState: .Normal) //普通状态下文
        
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

    @IBAction func returnTopPage(sender: UIBarButtonItem) {
        //println(111)
        //返回上一页
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordDou: UITextField!
    @IBAction func xgmm() {
        var passwordV = password.text
        var passwordDouV = passwordDou.text
        //验证是否为空
        if passwordV == "" || passwordDouV == "" {
            self.noticeOnlyText("请输入要修改的密码")
            return
        }
        
        //验证俩次输入是否一致
        if passwordV != passwordDouV {
            self.noticeOnlyText("俩次密码输入不一致哦！")
            return
        }
        
        //获取手机号码和验证码
        var userDefault = NSUserDefaults.standardUserDefaults()
        var phone = userDefault.stringForKey("phone")!
        var yzm = userDefault.stringForKey("yzm")!
        
        //println(yzm)
        
//        1.缺少必要参数，请重试！
//        2.密码输入不一致，请重试！
//        3.请输入11位手机号码
//        4.您尚未注册，请先注册！
//        5.验证码已失效，请重新获取
//        6.修改成功
//        7.请输入正确验证码
//        8.修改失败，请联系中美网络部！
        
//        password	第一次输入密码
//        passworddou	第二次输入密码
//        phone	手机号码
//        yzm	验证码
        //网络请求
        let manager = Alamofire.Manager.sharedInstance
        
        //网络验证
        //联网等待
        self.pleaseWait()
        var parameter = ["password": passwordV,"passworddou": passwordDouV,"phone": phone,"yzm": yzm]
        
        //println(parameter)
        let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/User/xgmm.php")
        manager.request(.POST,URL!, parameters: parameter).responseJSON() {
            (request, response, JSON, error) in
            //println(JSON)
            if error == nil {
                //println(JSON)
                //return
                //清除等待
                self.clearWaitNotice()
                //叹号作用拆包 可选包 有值 无值 叹号解析有值
                //提示字符串
                let str = JSON!.valueForKey("str")! as! String
                //状态代码
                let stu = JSON!.valueForKey("stu")! as! Int
                
                if (stu == 6) {
                    //密码修改成功
                    self.successNotice(str)
                    //清空登录信息
                    self.clearLogInfo()
                    //调转登录页面
                    self.goToLogin()
                    return
                }else if (stu == 4) {
                    //密码修改成功
                    self.noticeOnlyText(str)
                    //调转登录页面
                    self.goToLogin()
                    return
                }else if (stu != 6) {
                    //密码修改失败
                    self.noticeOnlyText(str)
                    return
                }
            
            }else{
                //清除等待
                self.clearWaitNotice()
                self.noticeOnlyText("网络连接超时...")
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearLogInfo() {
        //清空NSUserDefaults信息
        var userDefau = NSUserDefaults.standardUserDefaults()
        userDefau.removeObjectForKey("userid")
        userDefau.removeObjectForKey("userfen")
        userDefau.removeObjectForKey("money")
        userDefau.removeObjectForKey("phone")
        //userDefau.removeObjectForKey("truename")
        userDefau.synchronize()
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

    
    func goToLogin(){
        var loginStory = UIStoryboard(name: "LoginResStoryboard", bundle: NSBundle.mainBundle())
        var loginController:LoginResViewController = loginStory.instantiateViewControllerWithIdentifier("loginRes") as! LoginResViewController
        var modeView = loginController
        self.navigationController?.pushViewController(modeView, animated: true)
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

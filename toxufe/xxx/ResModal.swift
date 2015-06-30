//
//  ResModal.swift
//  xxx
//
//  Created by txf on 15/6/10.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import Foundation
import Alamofire

func goToLogin(obj:RegViewController){
    //var reg = RegViewController().navigationController
    
    println(obj.navigationController)
    
    var loginStory = UIStoryboard(name: "LoginResStoryboard", bundle: NSBundle.mainBundle())
    var loginController:LoginResViewController = loginStory.instantiateViewControllerWithIdentifier("loginRes") as! LoginResViewController
    var modeView = loginController
    obj.navigationController!.pushViewController(modeView, animated: true)
    
    //从堆栈中删除上一个
    //var navigationarray = NSMutableArray(array: reg.navigationController!.viewControllers!)
    //println(navigationarray)
    //删除最后一个
    //if navigationarray.count>=2 {
        //navigationarray.removeObjectAtIndex(navigationarray.count-2)
        //重新赋值
        //reg.navigationController?.viewControllers = navigationarray as NSMutableArray as [AnyObject]
    //}
}

////注册函数
//func regUSER( phone: String , password : String , yzm : String ){
//    //RegViewController().noticeOnlyText("111")
//    var obj = RegViewController()
//    
//    //获取网络是否连接
//    var isNetwork = getNetwork_Yuye()
//    if !isNetwork {
//        obj.noticeOnlyText("您的网络未连接哦！")
//        return
//    }
//    
//    //判断参数
//    if phone == "" || password == "" || yzm == "" {
//        obj.noticeOnlyText("缺少必要信息！")
//        return
//    }
//
//    //网络请求
//    let manager = Alamofire.Manager.sharedInstance
//    //联网等待
//    obj.pleaseWait()
//    var parameter = ["phone": phone,"password": password,"yzm": yzm]
//    let URL = NSURL(string: "http://app.zmyy.cn/Api_inc/User/addUser.php")
//    manager.request(.POST,URL!, parameters: parameter).responseJSON() {
//        (request, response, JSON, error) in
//        if error == nil {
//            //清除等待
//            obj.clearWaitNotice()
//            //叹号作用拆包 可选包 有值 无值 叹号解析有值
//            //提示字符串
//            let str = JSON!.valueForKey("str")! as! String
//            //状态代码
//            let stu = JSON!.valueForKey("stu")! as! Int
//            
//            if (stu != 6) {
//                
//                
//                //跳转登录页面
//                goToLogin(obj)
//                
//                
//                //短信发送失败
//                //obj.noticeOnlyText(str)
//                return
//            }else if (stu == 6) {
//                //短信发送成功
//                obj.successNotice(str)
//                //跳转登录页面
//                goToLogin(obj)
//            }
//            
//        }else{
//            //清除等待
//            obj.clearWaitNotice()
//            obj.noticeOnlyText("网络连接超时...")
//        }
//        
//    }
//    
//    
//    
//}
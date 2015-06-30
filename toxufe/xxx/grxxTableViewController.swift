//
//  grxxTableViewController.swift
//  xxx
//
//  Created by txf on 15/5/11.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class grxxTableViewController: UITableViewController {

    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var exitButtion: UIButton!
    //建立连接
    @IBOutlet weak var tableviewInfo: UserInfoUITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //委托行为和数据源
        tableviewInfo.delegate = self

        //设置导航标题字体
        let titlerFont  = UIFont(name: "Microsoft yahei", size: 19.0)
        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont!,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        
        //设置按钮标题颜色
        
        //边框颜色
        let color1 = returnRgb(204).CGColor as CGColorRef
        exitButtion.layer.borderColor = color1
        //边框宽度
        exitButtion.layer.borderWidth = 1
        //圆角
        exitButtion.layer.cornerRadius = 32.0
        let exitButtionColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
        let exitButtionFont  = UIFont(name: "Microsoft yahei", size: 16.0)
        exitButtion.setTitleColor(exitButtionColor, forState: UIControlState.Normal)
        //设置字体
        exitButtion.titleLabel?.font = exitButtionFont
        
        
        
        //设置导航栏颜色
        let titlerColor1 = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = titlerColor1
        
        
        //设置个人信息账户
        //获取登录信息
        var defaultUser = NSUserDefaults.standardUserDefaults()
        var phone = defaultUser.stringForKey("phone")
        var turePhone = ""
        if phone != nil {
            turePhone = phone!
        }else {
            turePhone = "未登录"
        }
        var info = "账户：\(turePhone)"
        let userInfoFont  = UIFont(name: "Microsoft yahei", size: 16.0)
        userInfo.text = info
        userInfo.textColor = titlerColor
        userInfo.font = userInfoFont
        


    }
    
    
    //单元格点击事件
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            //头像
            //定位故事版
            var touxiangstory:UIStoryboard = UIStoryboard(name: "TouxiangStoryboard", bundle: NSBundle.mainBundle())
            //实例化controller
            var touxiangcontroller:TouxiangTableViewController = touxiangstory.instantiateViewControllerWithIdentifier("touxiang") as! TouxiangTableViewController
            touxiangcontroller.gggg = tableviewInfo.pron[indexPath.row]
            touxiangcontroller.gggg = "我是头像修改页面"
            self.navigationController?.pushViewController(touxiangcontroller, animated: true)
            
        } else if indexPath.row == 2 {
            //昵称
            //定位故事版
            var nichengStory:UIStoryboard = UIStoryboard(name: "NichengStoryboard", bundle: NSBundle.mainBundle())
            //实例化contorller
            var nichengController:NichengTableViewController = nichengStory.instantiateViewControllerWithIdentifier("nicheng") as! NichengTableViewController
            //数据传递
            nichengController.ttt = tableviewInfo.pron[indexPath.row]
            nichengController.ttt = "我是修改昵称的页面"
            
            self.navigationController?.pushViewController(nichengController, animated: true)
        }
    }
    

    
    @IBAction func exitLogin(sender: UIButton) {
        println("退出登录")
    }
    //返回上一页
    @IBAction func backMain(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

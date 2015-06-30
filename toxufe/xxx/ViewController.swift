//
//  ViewController.swift
//  xxx
//
//  Created by txf on 15/5/9.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit
import IJReachability


class ViewController: UIViewController {
    

    
    //调转实名认证
    @IBAction func goShiming(sender: UIButton) {
        //要调转的storyboard的名称---该文件除去后缀的名称
        var smStoryBoard:UIStoryboard = UIStoryboard(name: "SM", bundle: NSBundle.mainBundle())
        //该storyboard下的主启动页面Identifier的命名
        let shimingController:UIViewController = smStoryBoard.instantiateViewControllerWithIdentifier("shiming") as! UIViewController
        //导航压栈
        self.navigationController?.pushViewController(shimingController, animated: true)
        
    }
    //跳转个人信息
    @IBAction func goGerenxinxi(sender: UIButton) {
        //要调转的storyboard的名称---该文件除去后缀的名称
        var grxxStoryBoard:UIStoryboard = UIStoryboard(name: "GRXX", bundle: NSBundle.mainBundle())
        //该storyboard下的主启动页面Identifier的命名
        let grxxController:UITableViewController = grxxStoryBoard.instantiateViewControllerWithIdentifier("grxx") as! UITableViewController
        //导航压栈
        self.navigationController?.pushViewController(grxxController, animated: true)
        
    }
    //获取网络状态
    @IBOutlet weak var netWorkLable: UILabel!
    @IBAction func getNetwork() {
        //println("获取网络状态")
        var isnetWork = getNetwork_Yuye()
        var netWorkType = getNetworkType()
        
        if !isnetWork {
            netWorkLable.text = "未联网"+netWorkType
        }else{
            netWorkLable.text = "网络连接成功"+netWorkType
        }
        
        
        
        
        
    }
    

    //调转页面函数
    func gotoNextView(){
        var loginStory = UIStoryboard(name: "LoginResStoryboard", bundle: NSBundle.mainBundle())
        var loginController:LoginResViewController = loginStory.instantiateViewControllerWithIdentifier("loginRes") as! LoginResViewController
        var modeView = loginController
        self.navigationController?.pushViewController(modeView, animated: true)
    }
    
    //调转登录页面
    @IBAction func goLogin(sender: UIButton) {
        gotoNextView()

        
   
    }
    //调转科室专家页面
    @IBAction func goKeshi(sender: UIButton) {
        var keshiStory = UIStoryboard(name: "KeshiStoryboard", bundle: NSBundle.mainBundle())
        var keshicontroller: KeshiViewController! = keshiStory.instantiateViewControllerWithIdentifier("keshi") as! KeshiViewController
        self.navigationController?.pushViewController(keshicontroller, animated: true)
        
        
    }
    
    //退出登录
    @IBAction func LogOut() {
        //清空NSUserDefaults信息
        var userDefau = NSUserDefaults.standardUserDefaults()
        userDefau.removeObjectForKey("userid")
        userDefau.removeObjectForKey("userfen")
        userDefau.removeObjectForKey("money")
        userDefau.removeObjectForKey("phone")
        //userDefau.removeObjectForKey("truename")
        
        textNeirong.text = "退出登录"
        userDefau.synchronize()
        gotoNextView()

        
        
    }
    @IBOutlet weak var textNeirong: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        //图片在线加载
//        let imageView = HYBLoadingImageView();
//        imageView.frame = CGRectMake(100, 100, 200, 200);
//        self.view.addSubview(imageView);
//        
//        //imageView.isCircle(isCircle: true);
//        imageView.image  = UIImage(named: "2.png")
//        imageView.loadImage("http://static.oschina.net/uploads/user/116/232345_50.jpg?t=1374372254000", holder: "") { (image) -> () in
//            println("加载成功了");
//        };
        
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        //今天说的是在TabBar嵌套Nav时，进行Push的时候隐藏TabBar的问题。
        self.hidesBottomBarWhenPushed = false
    }
    
    override func viewWillAppear(animated: Bool) {
        //在这块设置导航栏颜色
        super.viewWillAppear(true)
        self.navigationController?.navigationItem.title = "xxx"
        self.navigationItem.title = "xxxx"
        let titlerFont = returnFont(18.0)
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont,NSFontAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        
        let mainColor = UIColor(red: 0.92, green: 0.25, blue: 0.24, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = mainColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //显示tabbar
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        //今天说的是在TabBar嵌套Nav时，进行Push的时候隐藏TabBar的问题。
        self.hidesBottomBarWhenPushed = true
        
        var userDefau   = NSUserDefaults.standardUserDefaults()
        if userDefau.stringForKey("userid") != nil {
            var userid     = userDefau.stringForKey("userid")
            var userfen     = userDefau.stringForKey("userfen")
            var money       = userDefau.stringForKey("money")
            var phone       = userDefau.stringForKey("phone")
            //var truename    = userDefau.stringForKey("truename")
            var str = "您的USERID是\(userid!)，您的积分为\(userfen!)，您的抵用金为\(money!)，您的电话号码是\(phone!)."
            //var str = "您的USERID是\(userid!)，您的积分为\(userfen!)，您的抵用金为\(money!)，您的电话号码是\(phone!)，您的真实姓名是\(truename!)"
            textNeirong.text = str
        }else{
            textNeirong.text = "退出登录"
        }
    }
    //健康养生
    @IBAction func goYangsheng(sender: UIButton) {
        println("程序翻页入口！")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //跳转前的准备
    }
    
    //反向过渡 怎么取消反向过渡
    @IBAction func unwindToMain(segue:UIStoryboardSegue){
        //segue.identifier.  = "xxxxxx"
        
        //segue.identifier = "xxx"
        //self.performSegueWithIdentifier(<#identifier: String?#>, sender: <#AnyObject?#>)
        var viewFrom: AnyObject = segue.sourceViewController
        
//        UIViewController *sourceViewController = segue.sourceViewController;
//        
//        if ([sourceViewController isKindOfClass:[YellowViewController class]]) {
//            NSLog(@"from yellow vc");
//        }
//        else if ([sourceViewController isKindOfClass:[BlueViewController class]]) {
//            NSLog(@"from blue vc");
//        }
        
        //[self performSegueWithIdentifier:@"greenUnwind" sender:self];
    
    }


}


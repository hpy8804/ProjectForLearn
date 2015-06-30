//
//  LoginResViewController.swift
//  xxx
//
//  Created by txf on 15/5/30.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class LoginResViewController: UIViewController {
    @IBOutlet weak var titlename: UINavigationItem!
    //返回上一页
    @IBAction func returnMain(sender: UIBarButtonItem) {
        //var MainStory = UIStoryboard(name: "MainTabBar", bundle: NSBundle.mainBundle())
        //var MainController:MainTabBarUITabBarController = MainStory.instantiateViewControllerWithIdentifier("mainTabbar") as! MainTabBarUITabBarController
  

        //MainController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        //self.presentViewController(MainController, animated: true, completion: nil)
        //self.navigationController?.popViewControllerAnimated(true)
        
        //显示TabBar
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.popToRootViewControllerAnimated(true)
        
//        for controler in self.navigationController!.viewControllers {
//            println(controler)
//            if controler .isKindOfClass(<#aClass: AnyClass#>){
//            
//            }
//        }
        

        
        
//        for (UIViewController *controller in self.navigationController.viewControllers) {
//            if ([controller isKindOfClass:[你要跳转到的Controller class]]) {
//                [self.navigationController popToViewController:controller animated:YES];
//            }
//        }
        


    }
    @IBOutlet weak var bgImage: UIImageView!
    override func viewDidAppear(animated: Bool) {
        bgImage.contentMode = UIViewContentMode.ScaleAspectFill
        bgImage.image = UIImage(named: "beijing.png")
        
        //显示图片
        bgImage.hidden = false

    }
    
    override func viewWillDisappear(animated: Bool) {
        bgImage.hidden = true
        self.tabBarController?.tabBar.hidden = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //println("框架\(self.view)")
        //println("屏幕\(UIScreen.mainScreen().applicationFrame)")
        //iOS7在Conttoller中新增了这个属性：
        //automaticallyAdjustsScrollViewInsets，当设置为YES时（默认YES），如果视图里面存在唯一一个UIScrollView或其子类View，那么它会自动设置相应的内边距，这样可以让scroll占据整个视图，又不会让导航栏遮盖。
        //我们设置automaticallyAdjustsScrollViewInsets这个属性为no，就可以解决这个问题。
        self.automaticallyAdjustsScrollViewInsets = false
        
        //隐藏TabBar
        //self.tabBarController?.tabBar.hidden = true
        //self.hidesBottomBarWhenPushed = true

        
        //导航栏设置
        let titlerFont  = returnFont(19.0)
        let titlerColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
        
        //导航栏属性
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        let mainColor = returnRgb(255)
        self.navigationController?.navigationBar.barTintColor = mainColor

    }
    override func viewWillAppear(animated: Bool) {
        //隐藏TabBar
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidDisappear(animated: Bool) {
        //显示TabBar
        //self.tabBarController?.tabBar.hidden = false
    }

    



    var apperBool = false
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        //println(1)
        
        if apperBool == false {
            let loginstroy = UIStoryboard(name: "LoginStoryboard", bundle: NSBundle.mainBundle())
            let loginContro: LoginTableViewController!   = loginstroy.instantiateViewControllerWithIdentifier("Login") as! LoginTableViewController
            
            
            let RegStory = UIStoryboard(name: "Reg", bundle: NSBundle.mainBundle())
            let RegContro: RegViewController!   = RegStory.instantiateViewControllerWithIdentifier("Reg") as! RegViewController
            
            
            
            let slidingContainerViewController = SlidingContainerViewController (
                parent: self,
                contentViewControllers: [loginContro,RegContro],
                titles: ["登陆", "注册"])
            view.addSubview(slidingContainerViewController.view)
            
            
            
            apperBool = true
            
        }
        

        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

}

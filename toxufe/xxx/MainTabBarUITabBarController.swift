//
//  MainTabBarUITabBarController.swift
//  xxx
//
//  Created by txf on 15/5/27.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class MainTabBarUITabBarController: UITabBarController {
    //var tabBarBgImg:UIImageView?
    //var tabBarBgImgSelected:UIImageView?

    @IBOutlet weak var UITabBarname: UITabBar!
    override func viewDidLoad() {
        
        
//        CGRect frame = CGRectMake(0, 0, 320, 49);
//        UIView *v = [[UIView alloc] initWithFrame:frame];
//        UIImage *img = [UIImage imageNamed:@"图片名"];
//        UIColor *color = [[UIColor alloc] initWithPatternImage:img];
//        v.backgroundColor = color;
//        [self.tabBarController.tabBar insertSubview:v atIndex:0];
//        self.tabBarController.tabBar.opaque = YES;
//        [color release];
//        [v release];

        
        
        
//        println(UITabBarname.items)
//        for (em,index) in enumerate(UITabBarname.items!) {
//            println(em)
//            if em == 0 {
//                self.tabBarItem.image = UIImage(named: "zhanghu")
//            }
//        }
        
        //self.selectedIndex = 1
        
        //self.tabBarItem.image = UIImage(named: "zhanghu")
        
        super.viewDidLoad()
        //隐藏自带的选项卡
        self.tabBar.hidden=false
        
//        var attributes = [
//            NSForegroundColorAttributeName : color,
//            NSShadowAttributeName : shadow,
//            NSFontAttributeName : titleFont
//        ]
        
        //这里修改字体颜色
        var attributes =  [
            NSForegroundColorAttributeName: UIColor(red: 255.0/255.0, green: 102.0/255.0, blue: 0/255.0, alpha: 1.0),
            //NSFontAttributeName: UIFont(name: "Microsoft yahei", size: 24.0)!,
            
        ]
        
        //UITabBarItem.appearance().selectedImage = UIImage(named: "jiankang")
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes , forState: UIControlState.Selected)
        
        
        
        
        //println(UITabBarItem)
        

        
        //这里修改图片颜色，使得图片和原图颜色一致
        //UITabBarItem.appearance().image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //UITabBarItem.appearance().selectedImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //选中图片的颜色
        UITabBarname.tintColor = UIColor(red: 255.0/255.0, green: 102.0/255.0, blue: 0/255.0, alpha: 1.0)

        
        
//        //设置选项卡字体
//        let titlerFont  = UIFont(name: "Microsoft yahei", size: 19.0)
//        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
//        
//        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(objectsAndKeys: UITextAttributeFont:titlerFont!), forState: UIControlStateNormal)
        
        
//[[UITabBarItem appearance]
//        setTitleTextAttributes:
//        [NSDictionary
//        dictionaryWithObjectsAndKeys:
//        [UIFont fontWithName:@"AmericanTypewriter" size:20.0f],
//        UITextAttributeFont,
//        [UIColor yellowColor],
//        UITextAttributeTextColor,
//        [UIColor redColor],
//        UITextAttributeTextShadowColor,[
//        NSValue valueWithUIOffset:UIOffsetMake(0.0f,1.0f)],UITextAttributeTextShadowOffset,nil] forState:UIControlStateNormal];
        
        
//        UITabBarItem.appearance().titleTextAttributesForState(<#state: UIControlState#>)
//        
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),
//            NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!]
        //UITabBarItem.appearance().setTitleTextAttributes(UIFont, forState: titlerFont)
        
//
//        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont!,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        
        
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//            [UIColor whiteColor], UITextAttributeTextColor,
//            nil] forState:UIControlStateNormal];
//        UIColor *titleHighlightedColor = [UIColor greenColor];
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//            titleHighlightedColor, UITextAttributeTextColor,
//            nil] forState:UIControlStateSelected];
        


        


        

        


        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(animated: Bool) {
//                self.navigationItem.title = "xxxx"
//                let titlerFont = returnFont(18.0)
//                let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont,NSFontAttributeName)
//                self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
//        
//                let mainColor = UIColor(red: 0.92, green: 0.25, blue: 0.24, alpha: 1)
//                self.navigationController?.navigationBar.barTintColor = mainColor
//                self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
//
//    }
//    override func viewWillLayoutSubviews() {
//        self.navigationItem.title = "xxxx"
//        let titlerFont = returnFont(18.0)
//        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont,NSFontAttributeName)
//        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
//        
//        let mainColor = UIColor(red: 0.92, green: 0.25, blue: 0.24, alpha: 1)
//        self.navigationController?.navigationBar.barTintColor = mainColor
//        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
//    }

    
    
    
    //自定义tabBar视图
    func customTabBar(){
        
//        var height=UIScreen.mainScreen().bounds.size.height
//        var width=UIScreen.mainScreen().bounds.size.width
//        var tabW=width
//        var tabH=height-49
//        tabBarBgImg=UIImageView(frame:CGRectMake(0,tabH,tabW,49))
//        //打开事件
//        tabBarBgImg!.userInteractionEnabled=true
//        tabBarBgImg!.image=UIImage(named:"tab_bg_all")
//        
//        //选中背影图片
//        var y=tabBarBgImg!.frame.size.height/2-45/2
//        tabBarBgImgSelected=UIImageView(frame:CGRectMake(5,y, 50, 45))
//        tabBarBgImgSelected!.image=UIImage(named:"zhanghu")
//        tabBarBgImg!.addSubview(tabBarBgImgSelected!)
//        
//        var x:CGFloat=0
//        var images=["zhanghu","zhanghu","zhanghu","zhanghu"]
//        var titles=["电影","新闻","新闻","新闻"]
//        var titleFont=UIFont.systemFontOfSize(12)
//        for  index in 0...3{
//            println(index)
//            var imgView=UIImageView(frame:CGRectMake( x+18, y+5, 22, 22))
//            //添加事件
//            imgView.userInteractionEnabled=true
//            imgView.tag=index
//            var tap=UITapGestureRecognizer(target:self,action:Selector("test:"))
//            imgView.addGestureRecognizer(tap)
//            
//            imgView.image = UIImage(named:images[index])
//            tabBarBgImg!.addSubview(imgView)
//            var title=UILabel(frame:CGRectMake(x+16,y+26,45,15))
//            title.text=titles[index]
//            title.font=titleFont
//            title.textColor = UIColor.whiteColor()
//            tabBarBgImg!.addSubview(title)
//            x+=57
//        }
//        self.view.addSubview(tabBarBgImg!)
//        
    }
    
    //加载子视图控制器
    func loadViewController(){
        //USA
        
//        var zhan
//        
//        var movie=zhanghuTableViewController()
//        var  movieItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:1)
//        movie.tabBarItem=movieItem
//        var movieNav=zhanghuTableViewController(rootViewController:movie)
//        //News
//        var news=NewsViewController()
//        var  newsItem=UITabBarItem(tabBarSystemItem: .Favorites,tag:2)
//        news.tabBarItem=newsItem
//        var newsNav=UINavigationController(rootViewController:news)
        
        
        
        //要调转的storyboard的名称---该文件除去后缀的名称
//        var grxxStoryBoard:UIStoryboard = UIStoryboard(name: "Zhanghu", bundle: NSBundle.mainBundle())
//        //该storyboard下的主启动页面Identifier的命名
//        let grxxController:zhanghuTableViewController = grxxStoryBoard.instantiateViewControllerWithIdentifier("zhanghu") as! zhanghuTableViewController
//
//        
//        //数组
//        var ctrls=[grxxController,grxxController,grxxController,grxxController]
//        //添加
//        self.setViewControllers(ctrls,animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
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

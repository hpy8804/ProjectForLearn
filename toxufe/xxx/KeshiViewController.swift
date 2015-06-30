//
//  KeshiViewController.swift
//  xxx
//
//  Created by txf on 15/5/21.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class KeshiViewController: UIViewController {
    
    @IBOutlet weak var titlename: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        //切换展示
        //viewDidAppear(true)

        
        //导航栏设置
        let titlerFont  = UIFont(name: "Microsoft yahei", size: 19.0)
        let titlerColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        titlename.title = "科室专家"
        
        //导航栏属性
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont!,NSFontAttributeName,titlerColor,NSForegroundColorAttributeName)
        
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]

        
        
        
    }

    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        let zhuanjistroy = UIStoryboard(name: "zhuanjiaNew", bundle: NSBundle.mainBundle())
        let zhuanjiaContro: zhuanjiaViewController!   = zhuanjistroy.instantiateViewControllerWithIdentifier("zhuanjianew") as! zhuanjiaViewController
        

        
        
        let keshiStory = UIStoryboard(name: "keshi", bundle: NSBundle.mainBundle())
        let keshiContro: keshiTableViewController!   = keshiStory.instantiateViewControllerWithIdentifier("keshi") as! keshiTableViewController
        
        let slidingContainerViewController = SlidingContainerViewController (
            parent: self,
            contentViewControllers: [keshiContro,zhuanjiaContro],
            titles: ["科室", "专家"])
        
        
        view.addSubview(slidingContainerViewController.view)
    
    }
    
    
    

    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        let testsyoyt1 = UIStoryboard(name: "SM", bundle: NSBundle.mainBundle())
//        let xxxfdsf1: SMViewController!   = testsyoyt1.instantiateViewControllerWithIdentifier("shiming") as! SMViewController
//        
//        
//        let testsyoyt = UIStoryboard(name: "SM", bundle: NSBundle.mainBundle())
//        let xxxfdsf: SMViewController!   = testsyoyt.instantiateViewControllerWithIdentifier("shiming") as! SMViewController
//        
//        let slidingContainerViewController = SlidingContainerViewController (
//            parent: self,
//            contentViewControllers: [xxxfdsf1,xxxfdsf],
//            titles: ["科室", "专家"])
//        
//        view.addSubview(slidingContainerViewController.view)
//
//    }
    
    //返回上层
    @IBAction func goToup(sender: UIBarButtonItem) {
        self.navigationController!.popViewControllerAnimated(true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

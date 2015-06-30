//
//  wenzhen.swift
//  xxx
//
//  Created by txf on 15/5/27.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class wenzhen: UINavigationController {

    @IBOutlet weak var wenzhen: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        var pic = "wenzhenl"
        if pic != "" {
            wenzhen.selectedImage = UIImage(named: pic)
        }
        
//        self.navigationItem.title = "xxxx"
//        let titlerFont = returnFont(18.0)
//        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: titlerFont,NSFontAttributeName)
//        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
//        
//        let mainColor = UIColor(red: 0.92, green: 0.25, blue: 0.24, alpha: 1)
//        self.navigationController?.navigationBar.barTintColor = mainColor
//        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
  

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(animated: Bool) {
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

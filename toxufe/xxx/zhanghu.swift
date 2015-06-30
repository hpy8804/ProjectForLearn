//
//  zhanghu.swift
//  xxx
//
//  Created by txf on 15/5/27.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class zhanghu: UINavigationController {

    @IBOutlet weak var zhanghu: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        zhanghu.image = UIImage(named: "zhanghu")
        
        var pic = "zhanghul"
        if pic != "" {
            zhanghu.selectedImage = UIImage(named: pic)
        }
        
//        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 49))
//        image.image = UIImage(named: "zhanghu")
//        self.tabBarController?.tabBar.insertSubview(image, atIndex: 3)
        
        //zhanghu.image = UIImage(named: "zhanghu")
        
        
        //self.title = "xxx"



        // Do any additional setup after loading the view.
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

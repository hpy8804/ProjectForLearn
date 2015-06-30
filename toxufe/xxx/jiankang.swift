//
//  MainUINavigationController.swift
//  xxx
//
//  Created by txf on 15/5/27.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class jiankang: UINavigationController {

    @IBOutlet weak var jiankang: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        var pic = "jiankangl"
        if pic != "" {
            jiankang.selectedImage = UIImage(named: pic)
            //println(jiankang.selectedImage)
        }
        

        //println(UIImage(named: "jiankangl"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//
//  JianKangNav.swift
//  xxx
//
//  Created by txf on 15/6/25.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import UIKit

class JianKangNav: UIBarButtonItem {
    override init(image: UIImage?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector) {
        super.init(image: image, style: style, target: target, action: action)
        
            }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.image = UIImage(named: "yangsheng.png")
        //self.style = UIBarButtonItemStyle.Done
        //self.target = self
        self.action = "eventRightBtn"
    }
    
    func eventRightBtn () {
        println("我是健康养生的右侧按钮")
    }
}

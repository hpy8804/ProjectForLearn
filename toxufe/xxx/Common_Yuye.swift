//
//  Common_Yuye.swift
//  xxx
//
//  Created by txf on 15/5/29.
//  Copyright (c) 2015年 jdzmyy. All rights reserved.
//

import Foundation
import UIKit
import IJReachability

//返回字体类型
func returnFont(xxx:CGFloat)->UIFont{
    return UIFont(name: "Microsoft yahei", size: xxx)!
}
//返回颜色RGB相等
func returnRgb(rgb:CGFloat)->UIColor{
    return UIColor(red: rgb/255, green: rgb/255, blue: rgb/255, alpha: 1)
    
}

//返回网络状态
func getNetwork_Yuye()->Bool{
    var isNetwork:Bool?
    if IJReachability.isConnectedToNetwork() {
        isNetwork = true
    } else {
        isNetwork = false
    }
    
    return isNetwork!
}

//返回网络类型
func getNetworkType()->String{
    var NetworkType = ""
    
    let statusType = IJReachability.isConnectedToNetworkOfType()
    //println(statusType)
    switch statusType {
        case .WWAN:
            NetworkType = "WWAN"
        case .WiFi:
            NetworkType = "WiFi"
        case .NotConnected:
            NetworkType = "NotConnected"
    }
    return NetworkType

}

